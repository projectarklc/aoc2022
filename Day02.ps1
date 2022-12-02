$PuzzleInput =  Get-Content $env:USERPROFILE/Development/AOC/aoc2022/Inputs/Day02.txt

# Rock = 1, Paper = 2, Scissors = 3
$Decoder = @(@{play = 'A'; score = 1 }, @{play = 'B'; score = 2 }, @{play = 'C'; score = 3 },
             @{play = 'X'; score = 1 }, @{play = 'Y'; score = 2 }, @{play = 'Z'; score = 3 })

function Set-Score {
    param (
        [int]$TheirScore,
        [int]$MyScore
    )
    $VictoryScore = 0
    #Catch the wrap around
    if($TheirScore -eq 1 -and $MyScore -eq 3) {
        $VictoryScore = 0
    } elseif($TheirScore -eq 3 -and $MyScore -eq 1) {
        $VictoryScore = 6
    } elseif($MyScore -gt $TheirScore) {
        $VictoryScore = 6 #Win
    } elseif ($MyScore -eq $TheirScore) {
        $VictoryScore = 3 #Tie
    } 
    $Score = $VictoryScore + $MyScore
    return $Score
}
function Puzzle1 {
    param (
        $PuzzleInput
    )
    $TotalScore = 0
    foreach($item in $PuzzleInput) {
        $TheirScore = ($Decoder | Where-Object {$_.play -eq $item[0]}).score
        $MyScore = ($Decoder | Where-Object { $_.play -eq $item[2] }).score
        $TotalScore += Set-Score -TheirScore $TheirScore -MyScore $MyScore
    }
    Write-Host "Puzzle 1 Total: " $TotalScore
    return $TotalScore
}

function Puzzle2 {
    param (
        $PuzzleInput
    )
    $TotalScore = 0
    foreach ($item in $PuzzleInput) {
        $TheirScore = ($Decoder | Where-Object { $_.play -eq $item[0] }).score
        $MyScore = ($Decoder | Where-Object { $_.play -eq $item[2] }).score
        switch ($item[2]) {
            'X' { # I lose
                if($TheirScore -eq 1) {
                    $MyScore = 3
                } else {
                    $MyScore = $TheirScore - 1
                }
             }
            'Z' { # I win
                if($TheirScore -eq 3) {
                    $MyScore = 1
                } else {
                    $MyScore = $TheirScore + 1
                } 
            } 
            Default { $MyScore = $TheirScore } # Draw
        }
        $score = Set-Score -TheirScore $TheirScore -MyScore $MyScore
        $TotalScore += $score
    }
    Write-Host "Puzzle 2 Total: " $TotalScore
    return $TotalScore

}

Puzzle1 -PuzzleInput $PuzzleInput
Puzzle2 -PuzzleInput $PuzzleInput