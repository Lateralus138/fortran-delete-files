! Please forgive this; it is my first ever Fortran program
! I probably won't have useful comments on this program at this point lol
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