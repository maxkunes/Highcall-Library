#define _CRT_SECURE_NO_WARNINGS

#include "../headers/hcvolume.h"
#include "../headers/hcerror.h"
#include "../headers/hcvirtual.h"
#include "../headers/hcstring.h"
#include "../headers/hcobject.h"

#include "../sys/hcsyscall.h"

#ifdef UNIMPLEMENTED
BOOLEAN HCAPI HcVolumeGetInformationA(
	_In_opt_  LPCSTR lpRootPathName,
	_Out_opt_ LPSTR  lpVolumeNameBuffer,
	_In_      DWORD   nVolumeNameSize,
	_Out_opt_ LPDWORD lpVolumeSerialNumber,
	_Out_opt_ LPDWORD lpMaximumComponentLength,
	_Out_opt_ LPDWORD lpFileSystemFlags,
	_Out_opt_ LPSTR  lpFileSystemNameBuffer,
	_In_      DWORD   nFileSystemNameSize
) {
	LPWSTR FileSystemNameU;
	LPWSTR VolumeNameU;
	PWCHAR RootPathNameW;
	BOOL Result;

	if (!(RootPathNameW = HcStringConvertAtoW(lpRootPathName)))
	{
		return FALSE;
	}

	VolumeNameU = NULL;
	FileSystemNameU = NULL;

	if (lpVolumeNameBuffer)
	{
		VolumeNameU = HcAlloc(nVolumeNameSize + sizeof(WCHAR));

		if (VolumeNameU == NULL)
		{
			goto FailNoMem;
		}
	}

	if (lpFileSystemNameBuffer)
	{
		FileSystemNameU = HcAlloc(nFileSystemNameSize + sizeof(WCHAR));

		if (FileSystemNameU == NULL)
		{
			if (VolumeNameU != NULL)
			{
				HcFree(VolumeNameU);
			}

		FailNoMem:
			HcErrorSetNtStatus(STATUS_NO_MEMORY);
			return FALSE;
		}
	}

	Result = HcVolumeGetInformationW(RootPathNameW,
		VolumeNameU,
		nVolumeNameSize,
		lpVolumeSerialNumber,
		lpMaximumComponentLength,
		lpFileSystemFlags,
		FileSystemNameU,
		nFileSystemNameSize);

	if (Result)
	{
		if (lpVolumeNameBuffer)
		{
			HcStringCopyConvertWtoA(VolumeNameU, lpVolumeNameBuffer, nVolumeNameSize);
		}

		if (lpFileSystemNameBuffer)
		{
			HcStringCopyConvertWtoA(FileSystemNameU, lpFileSystemNameBuffer, nFileSystemNameSize);
		}
	}

	if (lpVolumeNameBuffer)
	{
		HcFree(VolumeNameU);
	}

	if (lpFileSystemNameBuffer)
	{
		HcFree(FileSystemNameU);
	}

	if (RootPathNameW)
	{
		HcFree(RootPathNameW);
	}

	return Result;
}
#endif

#ifdef UNIMPLEMENTED
BOOLEAN HCAPI HcVolumeGetInformationW(
	_In_opt_  LPCWSTR lpRootPathName,
	_Out_opt_ LPWSTR  lpVolumeNameBuffer,
	_In_      DWORD   nVolumeNameSize,
	_Out_opt_ LPDWORD lpVolumeSerialNumber,
	_Out_opt_ LPDWORD lpMaximumComponentLength,
	_Out_opt_ LPDWORD lpFileSystemFlags,
	_Out_opt_ LPWSTR  lpFileSystemNameBuffer,
	_In_      DWORD   nFileSystemNameSize
) {
	PFILE_FS_VOLUME_INFORMATION FileFsVolume;
	PFILE_FS_ATTRIBUTE_INFORMATION FileFsAttribute;
	IO_STATUS_BLOCK IoStatusBlock;
	WCHAR RootPathName[MAX_PATH];
	UCHAR Buffer[max(FS_VOLUME_BUFFER_SIZE, FS_ATTRIBUTE_BUFFER_SIZE)];

	HANDLE hFile;
	NTSTATUS errCode;

	FileFsVolume = (PFILE_FS_VOLUME_INFORMATION)Buffer;
	FileFsAttribute = (PFILE_FS_ATTRIBUTE_INFORMATION)Buffer;

	if (HcStringIsNullOrEmpty(lpRootPathName))
	{
		GetCurrentDirectoryW(MAX_PATH, RootPathName);
	}
	else
	{
		HcStringCopyW(RootPathName, lpRootPathName, 3);
	}
	RootPathName[3] = 0;

	hFile = InternalOpenDirW(RootPathName, FALSE);
	if (hFile == INVALID_HANDLE)
	{
		return FALSE;
	}

	errCode = HcQueryVolumeInformationFile(hFile,
		&IoStatusBlock,
		FileFsVolume,
		FS_VOLUME_BUFFER_SIZE,
		FileFsVolumeInformation);

	if (!NT_SUCCESS(errCode))
	{
		HcObjectClose(hFile);
		HcErrorSetNtStatus(errCode);
		return FALSE;
	}

	if (lpVolumeSerialNumber)
		*lpVolumeSerialNumber = FileFsVolume->VolumeSerialNumber;

	if (lpVolumeNameBuffer)
	{
		if (nVolumeNameSize * sizeof(WCHAR) >= FileFsVolume->VolumeLabelLength + sizeof(WCHAR))
		{
			memcpy(lpVolumeNameBuffer,
				FileFsVolume->VolumeLabel,
				FileFsVolume->VolumeLabelLength);

			lpVolumeNameBuffer[FileFsVolume->VolumeLabelLength / sizeof(WCHAR)] = 0;
		}
		else
		{
			HcObjectClose(hFile);
			HcErrorSetNtStatus(STATUS_INSUFFICIENT_RESOURCES);
			return FALSE;
		}
	}

	errCode = HcQueryVolumeInformationFile(hFile,
		&IoStatusBlock,
		FileFsAttribute,
		FS_ATTRIBUTE_BUFFER_SIZE,
		FileFsAttributeInformation);

	HcObjectClose(hFile);
	if (!NT_SUCCESS(errCode))
	{
		HcErrorSetNtStatus(errCode);
		return FALSE;
	}

	if (lpFileSystemFlags)
		*lpFileSystemFlags = FileFsAttribute->FileSystemAttribute;

	if (lpMaximumComponentLength)
		*lpMaximumComponentLength = FileFsAttribute->MaximumComponentNameLength;

	if (lpFileSystemNameBuffer)
	{
		if (nFileSystemNameSize * sizeof(WCHAR) >= FileFsAttribute->FileSystemNameLength + sizeof(WCHAR))
		{
			memcpy(lpFileSystemNameBuffer,
				FileFsAttribute->FileSystemName,
				FileFsAttribute->FileSystemNameLength);

			lpFileSystemNameBuffer[FileFsAttribute->FileSystemNameLength / sizeof(WCHAR)] = 0;
		}
		else
		{
			HcErrorSetNtStatus(STATUS_INSUFFICIENT_RESOURCES);
			return FALSE;
		}
	}
	return TRUE;
}
#endif