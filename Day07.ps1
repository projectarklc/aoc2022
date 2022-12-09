$PuzzleInput = Get-Content './Inputs/Day07.txt'

function Puzzle1 {
    param (
        $PuzzleInput
    )
    $MatchCount = 0
    $dirObject = [PSCustomObject]@{
        Name = '/'
    }
    $WorkingDirectory = '/'
    for ($i = 2; $i -le $PuzzleInput.Length; $i++) {
        $item = $PuzzleInput[$i]
        # Write-Host $item
        if($null -ne $item) {
            if($item.Length -gt 4) {
                $substr = $item.SubString(0, 4)
                Write-Host $substr $item.Length
                if ($substr -eq '$ cd') {
                    $WorkingDirectory = $item.Substring(4).Trim()
                    Write-Host "Switching working directory to " $WorkingDirectory
                }
            }

        }


    }
    Write-Host 'Puzzle 1: ' $MatchCount
    return $MatchCount
}

Puzzle1 -PuzzleInput $PuzzleInput
