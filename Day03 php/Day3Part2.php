<?php
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
    $msgSize = 5;
    
    $colCounts = [];
    for ($ii = 0; $ii < $msgSize; $ii++)  {
        array_push($colCounts, [0, 0]);
    }

    // convert to line by line format
    $input = trim(preg_replace('/\s\s+/', '--', $input));
    $input = explode('--', $input);
    
    function findSignificantBit($lines, $index, $most = true) {
        $zeros = 0;
        $ones = 0;
        
        foreach ($lines as $line) {
            # extract the value
            $chars = str_split($line);
            $value = (int) $chars[$index];
            
            if ($value == 0) {
                $zeros++;
            }
            else {
                $ones++;
            }
        }
        
        if ($most == true) {
            return $zeros > $ones ? 0 : 1;
        }
        else {
            return $zeros <= $ones ? 0 : 1;
        }
    }
    
    # find most and least significant bits
    $msb = findSignificantBit($input, 0, true);
    $lsb = findSignificantBit($input, 0, false);
    
    # filter by oxygen and carbon
    $oxygen = [];
    $carbon = [];
    foreach ($input as $line) {
        # extract the first value
        $chars = str_split($line);
        $value = (int) $chars[0];
        
        # filter by oxygen and carbon
        if ($value == $msb) {
            array_push($oxygen, $line);
        }
        if ($value == $lsb) {
            array_push($carbon, $line);
        }
    }
    
    
    
    $index = 1;
    while (sizeof($oxygen) > 1) {
        $msb = findSignificantBit($oxygen, $index, true);
        $oxygenNew = [];
        
        foreach ($oxygen as $line) {
            # extract the value
            $chars = str_split($line);
            $value = (int) $chars[$index];
        
            # keep only those lines
            if ($msb == $value) {
                array_push($oxygenNew, $line);
            }
        }
        
        $oxygen = $oxygenNew;
        $index++;
    }
    
    $index = 1;
    while (sizeof($carbon) > 1) {
        $lsb = findSignificantBit($carbon, $index, false);
        $carbonNew = [];
        
        foreach ($carbon as $line) {
            # extract the value
            $chars = str_split($line);
            $value = (int) $chars[$index];
        
            # keep only those lines
            if ($lsb == $value) {
                array_push($carbonNew, $line);
            }
        }
        
        
        
        $carbon = $carbonNew;
        $index++;
        
    }
    
    echo bindec($oxygen[0]) * bindec($carbon[0]);

?>