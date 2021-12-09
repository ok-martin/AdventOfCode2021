"https://learnxinyminutes.com/docs/smalltalk/"
| inputFishStr setFishStr setFish ii setNewFish fishPopulation cycle fishCount |
inputFishStr := '3,5,3,1,4,4,5,5,2,1,4,3,5,1,3,5,3,2,4,3,5,3,1,1,2,1,4,5,3,1,4,5,4,3,3,4,3,1,1,2,2,4,1,1,4,3,4,4,2,4,3,1,5,1,2,3,2,4,4,1,1,1,3,3,5,1,4,5,5,2,5,3,3,1,1,2,3,3,3,1,4,1,5,1,5,3,3,1,5,3,4,3,1,4,1,1,1,2,1,2,3,2,2,4,3,5,5,4,5,3,1,4,4,2,4,4,5,1,5,3,3,5,5,4,4,1,3,2,3,1,2,4,5,3,3,5,4,1,1,5,2,5,1,5,5,4,1,1,1,1,5,3,3,4,4,2,2,1,5,1,1,1,4,4,2,2,2,2,2,5,5,2,4,4,4,1,2,5,4,5,2,5,4,3,1,1,5,4,5,3,2,3,4,1,4,1,1,3,5,1,2,5,1,1,1,5,1,1,4,2,3,4,1,3,3,2,3,1,1,4,4,3,2,1,2,1,4,2,5,4,2,5,3,2,3,3,4,1,3,5,5,1,3,4,5,1,1,3,1,2,1,1,1,1,5,1,1,2,1,4,5,2,1,5,4,2,2,5,5,1,5,1,2,1,5,2,4,3,2,3,1,1,1,2,3,1,4,3,1,2,3,2,1,3,3,2,1,2,5,2'.

"inputFish do: [:a | Transcript show: a printString; cr]."

"convert to an array of strings"
setFishStr := (inputFishStr substrings: ',').

"convert to an array of numbers"
setFish := setFishStr collect: [:a | a asNumber].

days := 18.
cycle := 6 + 1.
fishCount := 0.

"create new array with zeros"
setNewFish := Array new: days.
setNewFish := setNewFish collect: [:a | 0].

(setFish) do: [:fish |
    "add new fish based on this fish half life"
    fish to: days by: cycle do: [:day |
        "increment in the array"
        currNewFish := setNewFish at: day.
        currNewFish := currNewFish + 1.
        setNewFish at: day put: currNewFish.
    ].
].

1 to: days do: [:day | 
    noFish := setNewFish at: day.
    Transcript show: noFish printString; cr.
    
    (noFish > 0) ifTrue: [
        fishCount := fishCount + noFish.
        
        startDay := day + cycle + 1.
        endDay := days - 1.
       
        startDay to: endDay by: cycle do: [:newDay | 
            currNewFish := setNewFish at: 4 + fishCount.
            setNewFish at: newDay put: currNewFish.
       ].
    ].
].

Transcript show: fishCount printString; cr.




"naive solution"
1 to: 18 do: [:day |   
    "fid new fish to add"
    "ii := 0."
    "(setFish) do: [:fish |"
    "   (fish = 0) ifTrue: ["
    "        ii := ii + 1."
    "    ]."
    "]."
    
    "number of fish with zero life in collection"
    ii := setFish occurrencesOf: 0.
    
    "create new population of fish with a life of 8"
    setNewFish := Array new: ii.
    setNewFish := setNewFish collect: [:a | 8].
    
    "traverse array and substract a day or replace zeros"
    setFish := setFish collect: [:a | 
        "if else"
        (a = 0) 
            ifTrue: [6]
            ifFalse: [a - 1].
    ].
    
    "combine two arrays"
    setFish := setFish, setNewFish.
].

fishPopulation := setFish size.

Transcript show: fishPopulation printString; cr.