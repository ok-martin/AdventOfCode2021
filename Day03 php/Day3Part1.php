<?php
	// used https://www.tutorialspoint.com/execute_php_online.php
    $input = '00100
        11110
        10110
        10111
        10101
        01111
        00111
        11100
        10000
        11001
        00010
        01010';
    
    // assuming the binary messages are always the same size
    $msgSize = 12;
    
    $colCounts = [];
    for ($ii = 0; $ii < $msgSize; $ii++)  {
        array_push($colCounts, [0, 0]);
    }

    // strip the input from new line characters and trim it
    $input = trim(preg_replace('/\s\s+/', '', $input));

    // create char array to loop through the input
    $chars = str_split($input);
    
    $currentCharIndex = 0;
    
    foreach ($chars as $char) {
        // convert to integer
        $value = (int) $char;
        
        // get the column for this bit
        $colIndex = $currentCharIndex % $msgSize;
        
        // count 1s and 0s for this column
        $colCounts[$colIndex][$value] = $colCounts[$colIndex][$value] + 1;

        $currentCharIndex++;
    }
    
    $gammaRate = '';
    $epsilonRate = '';

    foreach ($colCounts as $col) {
        $gamma = 0;
        $epsilon = 1;
        
        if ($col[1] > $col[0]) {
            $gamma = 1;
            $epsilon = 0;
        }
        
        $gammaRate .= $gamma;
        $epsilonRate .= $epsilon;
    }
    
    $gammaRate = bindec($gammaRate);
    $epsilonRate = bindec($epsilonRate);
    
    echo $gammaRate;
    echo ' ';
    echo $epsilonRate;
    echo ' ';
    echo $gammaRate * $epsilonRate;
?>