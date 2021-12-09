Program AOC2Day2Part1
    implicit none
    integer :: ios
    integer, parameter :: read_unit = 99
    character(len=200) :: line(3000)
    integer :: n, i
    integer :: cmdValue = 0
    integer :: position = 0
    integer :: depth = 0
    integer :: aim = 0
    
    open(unit=read_unit, file='Day2Input.txt', iostat=ios)
    if ( ios /= 0 ) stop "Error opening file"

    n = 0

    do
        read(read_unit, '(A)', iostat=ios) line(n+1)
        if (ios /= 0) exit
        n = n + 1
    end do

    print*, "File contains ", n, "commands"

    close(read_unit)

    do i = 1, n
        if (index(line(i), 'forward') > 0) then
            ! read the end of the line (up to 3 digits and) convert to integer 
            read (line(i)(9:11), '(I5)') cmdValue
            position = position + cmdValue
            depth = depth + aim * cmdValue
        end if
        if (index(line(i), 'up') > 0) then
            ! read the end of the line (up to 3 digits and) convert to integer 
            read (line(i)(4:7), '(I5)') cmdValue
            aim = aim - cmdValue
        end if
        if (index(line(i), 'down') > 0) then
            ! read the end of the line (up to 3 digits and) convert to integer 
            read (line(i)(6:9), '(I5)') cmdValue
            aim = aim + cmdValue
        end if
    end do
    
    Print *, position * depth
End Program AOC2Day2Part1