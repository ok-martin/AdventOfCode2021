// https://adventofcode.com/2021/day/4
// part 1 answer: 44736
// part 2 answer: 1827
// https://www.onlinegdb.com/edit/g_NyCxvYN
program AOC_Day4;

var 
    txtFile: TextFile;
    line: UnicodeString;
    boards: array[0..999, 0..9, 0..4] of integer;
    boardArr: array[0..9, 0..4] of integer;
    boardRow: array[0..4] of integer;
    ii: integer = 0;
    jj: integer = 0;
    kk: integer = 0;
    lineValStr: string = '';
    lineValInt: integer;
    lineValCode: integer;
    lineChar: char;
    lineCharIndex: integer = 0;
    lineInputNumbers: UnicodeString;
    boardScores: array[0..999, 0..9] of integer;
    boardMarks: array[0..999, 0..9, 0..4] of integer;
    boardWon: array[0..999] of integer;
    minRow: integer = 0;
    maxRow: integer = 5;
    sum: integer = 0;
    
var i, j, k, row, col: integer;

function generateValue(): integer;
var result: integer;
begin
    result := 0;
    
    // make sure it is not empty
    if length(lineValStr) > 0 then
    begin
        // convert string to integer
        Val(lineValStr, lineValInt, lineValCode);
        
        // save to array
        boardRow[kk] := lineValInt;
        // write(lineValInt);
        // write(',');
        
        // clear the buffer
        lineValStr := '';
        
        // move to the next column
        kk := kk + 1;
    end
end;


begin
    assign(txtFile, 'input.txt');
    
    // open the file for reading
    reset(txtFile); 
    
    // read the bingo numbers
    readln(txtFile, lineInputNumbers);
    
    // read the break
    readln(txtFile, line);
    
    // keep reading lines until the end of the file is reached
    while not eof(txtFile) do
    begin
        readln(txtFile, line);
        
        // new board
        if line = '' then
        begin
            // add the old board
            boards[ii] := boardArr;
            // writeln('--');
            
            // move to the next board
            ii := ii + 1;
            jj := 0;
            kk := 0;
        end
        
        // number row
        else
        begin
            // go through char by char
            for lineChar in line do
            begin
                // seperator, form a number and add it to the row
                if lineChar = ' ' then
                    begin
                        generateValue();
                    end
                // keep forming a string
                else
                    begin
                        // add the number to the string
                        lineValStr := concat(lineValStr, lineChar);
                    end;
                
            end;
            
            // make sure to get the last value at the end of the line
            generateValue();
            
            // add the new row to this board
            boardArr[jj] := boardRow;
            // writeln();
            
            // write columns as rows too
            for i:=low(boardRow) to high(boardRow) do
            begin
                boardArr[i+5][jj] := boardRow[i];
            end;
            
            // clear the buffer
            lineValStr := '';
            
            // move to the next row
            jj := jj + 1;
            
            // clear column index
            kk := 0;
        end;
    end;
    
    // add the last board
    boards[ii] := boardArr;
    // writeln('--');
    
    // move to the next board
    ii := ii + 1;
    jj := 0;
    kk := 0;
    
    close(txtFile);
    
    
    
    
    // go through each number
    for lineChar in lineInputNumbers do
    begin
        if (lineChar = ',') and (lineValStr <> '') then
        begin
            Val(lineValStr, lineValInt, lineValCode);
            lineValStr := '';
            
            // mark the number in every board
            for i:=low(boards) to (ii-1) do
            begin
                // rows
                for j:=low(boards[i]) to high(boards[i]) do
                begin
                    // cols
                    for k:=low(boards[i][j]) to high(boards[i][j]) do
                    begin
                        // find matching numbers
                        if lineValInt = boards[i][j][k] then
                        begin
                            // mark the number on this board
                            boardMarks[i][j][k] := 1;
                            boardScores[i][j] := boardScores[i][j] + 1;
                            
                            // if winning row/col
                            if boardScores[i][j] = 5 then
                            begin
                                // sum unmarked numbers on the board if the board id not win yet
                                if boardWon[i] <> 1 then
                                begin
                                    // if winning row
                                    if j < 5 then
                                    begin
                                        minRow := 0;
                                        maxRow := 4;
                                    end
                                    
                                    // if winning column
                                    else
                                    begin
                                        minRow := 5;
                                        maxRow := 9;
                                    end;
                                    
                                    // calculate the sum of unmarked numbers
                                    sum := 0;
                                    
                                     // go through the winning board rows
                                    for row:=minRow to maxRow do
                                    begin
                                        // go through the winning board values
                                        for col:=low(boards[i][row]) to high(boards[i][row]) do
                                        begin
                                            if ((j < 5) and (row <> j)) or ((j > 4) and (j <> col)) then
                                            begin
                                                if boardMarks[i][row][col] <> 1 then
                                                begin
                                                    sum := sum + boards[i][row][col];
                                                    write(boards[i][row][col], ',');
                                                end
                                            end
                                        end;
                                    end;
                                    
                                    writeln('sum ', sum * lineValInt);
                                    boardWon[i] := 1;
                                end;
                                
                            end;
                        end;
                    end;
                end;
            end;
            
        end
        else
            lineValStr := concat(lineValStr, lineChar);
    end;
    
end.
