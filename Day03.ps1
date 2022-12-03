$PuzzleInput = Get-Content './Inputs/Day03.txt'

$Decoder = @(@{letter = 'a'; score = 1}, @{letter = 'b'; score = 2}, @{letter = 'c'; score = 3}, @{letter = 'd'; score = 4}, @{letter = 'e'; score = 5},
           @{letter = 'f'; score = 6}, @{letter = 'g'; score = 7}, @{letter = 'h'; score = 8}, @{letter = 'i'; score = 9}, @{letter = 'j'; score = 10},
           @{letter = 'k'; score = 11}, @{letter = 'l'; score = 12}, @{letter = 'm'; score = 13}, @{letter = 'n'; score = 14}, @{letter = 'o'; score = 15}, 
           @{letter = 'p'; score = 16}, @{letter = 'q'; score = 17}, @{letter = 'r'; score = 18}, @{letter = 's'; score = 19}, @{letter = 't'; score = 20},
           @{letter = 'u'; score = 21}, @{letter = 'v'; score = 22}, @{letter = 'w'; score = 23}, @{letter = 'x'; score = 24} ,@{letter = 'y'; score = 25},
           @{letter = 'z'; score = 26}, @{letter = 'A'; score = 27}, @{letter = 'B'; score = 28}, @{letter = 'C'; score = 29} ,@{letter = 'D'; score = 30},
           @{letter = 'E'; score = 31}, @{letter = 'F'; score = 32}, @{letter = 'G'; score = 33}, @{letter = 'H'; score = 34} ,@{letter = 'I'; score = 35},
           @{letter = 'J'; score = 36}, @{letter = 'K'; score = 37}, @{letter = 'L'; score = 38}, @{letter = 'M'; score = 39} ,@{letter = 'N'; score = 40},
           @{letter = 'O'; score = 41}, @{letter = 'P'; score = 42}, @{letter = 'Q'; score = 43}, @{letter = 'R'; score = 44} ,@{letter = 'S'; score = 45},
           @{letter = 'T'; score = 46}, @{letter = 'U'; score = 47}, @{letter = 'V'; score = 48}, @{letter = 'W'; score = 49} ,@{letter = 'X'; score = 50},
           @{letter = 'Y'; score = 51}, @{letter = 'Z'; score = 52}
)

function Puzzle1 {
    param (
        $PuzzleInput
    )
    $scores = @()
    foreach($item in $PuzzleInput) {
        $midPoint = $item.Length / 2
        $firsthalf = $item.Substring(0, $midPoint)
        $secondHalf = $item.Substring($midPoint)
        $sameItems = @()
        for($i = 0; $i -lt $firsthalf.Length; $i++) {
                if($secondHalf.contains($item[$i])) {
                $sameItems+= $item[$i]
            }
            
        }
        $sameItems = $sameItems | Select-Object -Unique | ForEach-Object { $scores += $_}  
    }
    $TotalScore = 0
    foreach($score in $scores) {
        $TotalScore += ($Decoder | Where-Object { $_.letter -ceq $score }).score
    }
    Write-Host "Puzzle 1: " $TotalScore
    return $TotalScore
}

function Puzzle2 {
    param (
        $PuzzleInput
    ) 
    $itemScores = @()
    for($i = 0; $i -lt $PuzzleInput.Count; $i += 3) {
        $sameItems = @()
        for($j = 0; $j -lt $PuzzleInput[$i].Length; $j++) {
            if($PuzzleInput[$i + 1].contains($PuzzleInput[$i][$j]) -and $PuzzleInput[$i + 2].contains($PuzzleInput[$i][$j])) {
                $sameItems += $PuzzleInput[$i][$j]
            }
        }
        $sameItems = $sameItems | Select-Object -Unique | ForEach-Object { $itemScores += $_ }
    }
    $TotalScore = 0
    foreach($itemScore in $itemScores) {
        $TotalScore += ($Decoder | Where-Object { $_.letter -ceq $itemScore }).score
    }
    Write-Host "Puzzle 2: " $TotalScore
    return $TotalScore
}

Puzzle1 -PuzzleInput $PuzzleInput
Puzzle2 -PuzzleInput $PuzzleInput