# Fortran Delete Files

This is sort of my &#34;Hello World&#34; program&#59; my first ever in the programming language **Fortran**&#46;

## Index

1. [Motivation](#motivation)
2. [Tests](#tests)
3. [Code & Source](#code)
4. [Files](#filesv)
5. [License](#license)

## Motivation <a name="motivation"></a>

I like to learn lots of programming languages and Fortran was next on my list&#46; I don&#39;t really do HW programs as I usually have an idea for what kind of software I want&#44; need&#44; or just want to write something different&#46;

## Tests - Compile and Run <a name="tests"></a>

This has been compiled and tested on both Windows and Linux&#46;

```Powershell
$OSI = Get-ComputerInfo
Write-Host ""$OSI.OsName "`n" $OSI.OsVerion 
 Microsoft Windows 10 Pro
 10.0.18363
g95 -o delete delete.f95 # compile
delete.exe *.file # assumming a.file and b.file
 Deleting: a.file.
 a.file was deleted successfully.
 Deleting: b.file.
 b.file was deleted successfully.
```

```Bash
$ cat /etc/*-release|grep "PRETTY_NAME"|cut -d'=' -f2
"Ubuntu 18.04.4 LTS"
$ uname -a|awk '{print $1" "$3" "$11}'
Linux 4.4.0-18362-Microsoft x86_64
$ gfortran -o delete delete.f95 # compile
$ delete *.file # assumming a.file and b.file
 Deleting: a.file.
 a.file was deleted successfully.
 Deleting: b.file.
 b.file was deleted successfully.
```

## Code <a name="code"></a>

[Source](./delete.f95)

```Fortran
program delete
    integer::numArgs,getArg,stat,stat_close
    logical::file_exists
    character(256)::trimArg,thisArg
    numArgs=command_argument_count()
    if(numArgs>0)then
        do getArg=1,numArgs
            call get_command_argument(getArg,thisArg)
            trimArg=trim(thisArg)
            inquire(file=trimArg,exist=file_exists)
            if ( file_exists ) then
                print *, 'Deleting: ',trim(trimArg), '.'
                open(unit=10, iostat=stat, file=trimArg, status='old')
                if (stat == 0) close(10, iostat=stat_close,status='delete')
                if (stat_close .gt. 0) then
                    print *, trim(trimArg),' was not deleted.'
                else
                    print *, trim(trimArg),' was deleted successfully.'
                end if
            else
                print *,trim(trimArg), ' does not exist.'
            end if
        end do
    end if
end program delete
```

## Files <a name="filesv"></a>

- [Source](./delete.f95)
- [Compiled - Windows](./delete_windows/delete.exe)
- [Compiled - Linux](./delete_linux/delete)
  

## License <a name="license"></a>

[LICENSE](./LICENSE)

>This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

>This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
