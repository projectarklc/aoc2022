function Puzzle1 {
    param (
        [string]$PuzzleInput,
        [int32]$UniqueCount
    )
    $Marker = 0
    for($i = 0; $i -le $PuzzleInput.Length; $i++) {
        $dataSet = $PuzzleInput.Substring($i, $UniqueCount)
        If (($dataSet.ToCharArray() | Select-Object -Unique).Length -eq $UniqueCount) {
            $Marker = $i + $UniqueCount
            break
        }
    }
    Write-Host "Puzzle 1: " $Marker
    return $Marker
}

$PuzzleInput = Get-Content $env:USERPROFILE/Development/AOC/aoc2022/Inputs/Day06.txt
Puzzle1 -PuzzleInput $PuzzleInput -UniqueCount 4
Puzzle1 -PuzzleInput $PuzzleInput -UniqueCount 14