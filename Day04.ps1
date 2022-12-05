$PuzzleInput = Get-Content './Inputs/Day04.txt'

function Puzzle1 {
    param (
        $PuzzleInput
    )
    $MatchCount = 0
    foreach($item in $PuzzleInput) {
        $splitInputs = $item.split(',')
        $input1Range = $splitInputs[0].split('-')
        $input2Range = $splitInputs[1].split('-')
        [int32]$lower1 = $input1Range[0]
        [int32]$upper1 = $input1Range[1]
        [int32]$lower2 = $input2Range[0]
        [int32]$upper2 = $input2Range[1]
        if(($lower1 -le $lower2 -and $upper1 -ge $upper2 ) -or ($lower2 -le $lower1 -and $upper2 -ge $upper1)) {
            $MatchCount++
        }
    }
    Write-Host 'Puzzle 1: ' $MatchCount
    return $MatchCount
}

function Puzzle2 {
    param (
        $PuzzleInput
    )
    $MatchCount = 0
    foreach($item in $PuzzleInput) {
        $splitInputs = $item.split(',')
        $input1Range = $splitInputs[0].split('-')
        $input2Range = $splitInputs[1].split('-')
        [int32]$lower1 = $input1Range[0]
        [int32]$upper1 = $input1Range[1]
        [int32]$lower2 = $input2Range[0]
        [int32]$upper2 = $input2Range[1]
        $upperArray = @()
        for($i = $lower2; $i -le $upper2; $i++) {
            $upperArray += $i
        }
        for($i = $lower1; $i -le $upper1; $i++) {
            if($upperArray -contains $i) {
                $MatchCount++
                break
            }
        }
    }
    Write-Host 'Puzzle 2: ' $MatchCount
    return $MatchCount
}

Puzzle1 -PuzzleInput $PuzzleInput
Puzzle2 -PuzzleInput $PuzzleInput
