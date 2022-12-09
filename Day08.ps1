$PuzzleInput = Get-Content './Inputs/Day08.txt'

function isVisibleinRow {
    param (
        $PuzzleInput,
        $rowPosition,
        $columnPosition
    )
    $CurrentItem = $PuzzleInput[$rowPosition][$columnPosition]
    $Visible = $true
    for($i = 0; $i -lt $PuzzleInput.Length; $i++) {
        if($PuzzleInput[$rowPosition][$i] -gt $CurrentItem) {
            $Visible = $false
            break;
        }
    }
    for($i = $PuzzleInput.Length; $i -ge 0; $i--) {
        if($PuzzleInput[$rowPosition][$i] -gt $CurrentItem) {
            $Visible = $false
            break
        }
    }
    return $Visible
}

function Puzzle1 {
    param (
        $PuzzleInput
    )
    $VisibleCount = 0
    Write-Host $PuzzleInput.Length
    if($PuzzleInput.Length) {
        for($i = 0; $i -le $PuzzleInput.Length; $i++) {
            $row = $PuzzleInput[$i]
            for($j = 0; $j -lt $row.Length; $j++) {
                $item = $row[$j]
                Write-Host $row[$j]
                if($i -eq 0 -or $j -eq 0) {
                    $VisibleCount++
                } elseif($i -eq $PuzzleInput.Length - 1) {
                        $VisibleCount++
                } else {
                    if(isVisibleinRow -PuzzleInput $PuzzleInput -rowPosition $i -columnPosition -j -eq $true) {
                        $VisibleCount++
                    }
                    # if($PuzzleInput[$i-1][$j] -lt $item -or $PuzzleInput[$i+1][$j] -lt $item -or $PuzzleInput[$i][$j+1] -lt $item -or $PuzzleInput[$i][$j-1] -lt $item) {
                    #     $VisibleCount++
                    # }
                }
            }
        }
    }


    Write-Host 'Puzzle 1: ' $VisibleCount
    return $VisibleCount
}

Puzzle1 -PuzzleInput $PuzzleInput
