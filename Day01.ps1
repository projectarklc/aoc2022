
function GetTotalsArray {
    param (
        $PuzzleInput
    )
    $TotalsArray = @()
    $total = 0
    foreach ($line in $PuzzleInput) {
        if ($line -eq '') {
            $TotalsArray += $total
            $total = 0
        }
        else {
            $total += $line
        }
    }
    return $TotalsArray
}

function Puzzle1 {
    param (
        $PuzzleInput
    )
    $TotalsArray = GetTotalsArray -PuzzleInput $PuzzleInput
    $HighestTotal = 0
    foreach($Total in $TotalsArray) {
        if($Total -gt $HighestTotal) {
            $HighestTotal = $total
        }
    }
    Write-Host "Puzzle 2: " $HighestTotal
    return $HighestTotal
}

function Puzzle2 {
    param (
        $PuzzleInput
    )
    $TotalsArray = GetTotalsArray -PuzzleInput $PuzzleInput
    $HighestTotals = @()
    foreach($Total in $TotalsArray) {
        if($HighestTotals.Count -lt 3) {
            $HighestTotals += $Total
        } else {
            $minvalue = $HighestTotals | Sort-Object -Descending | Select-Object -Last 1
            $index = $HighestTotals.IndexOf($minvalue)
            if($Total -gt $minvalue) {
                $HighestTotals[$index] = $Total
            }
        }

    }
    $SumTotal = 0
    $HighestTotals | ForEach-Object { $SumTotal += $_ }
    Write-Host "Puzzle 2: " $SumTotal
    return $SumTotal
}

$PuzzleInput =  Get-Content $env:USERPROFILE/Development/AOC/aoc2022/Inputs/Day01.txt
Puzzle1 -PuzzleInput $PuzzleInput
Puzzle2 -PuzzleInput $PuzzleInput
