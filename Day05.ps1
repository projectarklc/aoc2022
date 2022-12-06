$PuzzleInput = Get-Content './Inputs/Day05.txt'

function Get-BaseRowArray {
    $baseRowLocation = 0
    $baseRowArray = @()
    for ($i = 0; $i -lt $PuzzleInput.Count; $i++) {
        if ($PuzzleInput[$i] -like ' 1   2   3*') {
            [int32]$baseRowLocation = $i - 1 #Location to start getting column data
            for ($j = 0; $j -le $PuzzleInput[$i].Length; $j++) {
                if ($PuzzleInput[$i][$j] -match '^[0-9]') {
                    #get numbers
                    $baseRowArray += [PSCustomObject]@{
                        ColumnName     = $PuzzleInput[$i][$j]
                        ColumnLocation = $j
                    }
                }
            }
            break
        }
    }
    
}
function Puzzle1 {
    param (
        $PuzzleInput
    )
    $baseRowLocation = 0
    $baseRowArray = @()
    for($i = 0; $i -lt $PuzzleInput.Count; $i++) {
        if($PuzzleInput[$i] -like ' 1   2   3*') {
            [int32]$baseRowLocation = $i - 1 #Location to start getting column data
            for($j = 0; $j -le $PuzzleInput[$i].Length; $j++) {
                if($PuzzleInput[$i][$j] -match '^[0-9]') { #get numbers
                    $baseRowArray += [PSCustomObject]@{
                        ColumnName = $PuzzleInput[$i][$j]
                        ColumnLocation = $j
                    }
                }
            }
            break
        }
    }
    $stacksArray = @()
    for($i = $baseRowLocation; $i -ge 0; $i--) {
        foreach($location in $baseRowArray) {
            if ($PuzzleInput[$i][$location.ColumnLocation] -match '^[A-Z]') {
                $stacksArray += [PSCustomObject]@{
                    ColumnName = $location.ColumnName
                    StackValue = $PuzzleInput[$i][$location.ColumnLocation]
                    StackLocation = ($baseRowLocation - $i)
                }
            }
        }
    }
    $baseRowLocation += 2 # The empty line between setup and instructions.

    for($i = $baseRowLocation; $i -le $PuzzleInput.Length - 1; $i++) {
        if ($PuzzleInput[$i].Length) {
            $inputArray = $PuzzleInput[$i].Split(' ')
            $MoveQty = $inputArray[1]
            $MoveFrom = $inputArray[3]
            $MoveTo = $inputArray[5]
            for ($j = 0; $j -lt $MoveQty; $j++) {
                $objectToMove = $stacksArray | Where-Object { $_.ColumnName -eq $MoveFrom } | Sort-Object -Property StackLocation -Descending | Select-Object -First 1
                $targetColumn = $stacksArray | Where-Object { $_.ColumnName -eq $MoveTo }
                $targetColumnCount = 0
                if ($null -ne $targetColumn ) {
                    if ($null -eq $targetColumn.Count) { # If there's only one object, you get an object.
                        $targetColumnCount = 1
                    } else {$targetColumnCount = $targetColumn.Count} #If there's more than one object, you get an array.
                } 
                if ($null -ne $objectToMove) {
                    $objectToMove.ColumnName = $MoveTo
                    $objectToMove.StackLocation = $targetColumnCount
                }
            }
        }

    }
    $finalOutput = ''
    foreach($column in $baseRowArray) {
        $TopCrate =  $stacksArray | Where-Object { $_.ColumnName -eq $column.ColumnName } | Sort-Object -Property StackLocation -Descending | Select-Object  -First 1
        $finalOutput += $TopCrate.StackValue
    }
    Write-Host 'Puzzle 1: ' $finalOutput
    return $finalOutput
}

function Puzzle2 {
    param (
        $PuzzleInput
    )
    $baseRowLocation = 0
    $baseRowArray = @()
    for ($i = 0; $i -lt $PuzzleInput.Count; $i++) {
        if ($PuzzleInput[$i] -like ' 1   2   3*') {
            [int32]$baseRowLocation = $i - 1 #Location to start getting column data
            for ($j = 0; $j -le $PuzzleInput[$i].Length; $j++) {
                if ($PuzzleInput[$i][$j] -match '^[0-9]') {
                    #get numbers
                    $baseRowArray += [PSCustomObject]@{
                        ColumnName     = $PuzzleInput[$i][$j]
                        ColumnLocation = $j
                    }
                }
            }
            break
        }
    }
    $stacksArray = @()
    for ($i = $baseRowLocation; $i -ge 0; $i--) {
        foreach ($location in $baseRowArray) {
            if ($PuzzleInput[$i][$location.ColumnLocation] -match '^[A-Z]') {
                $stacksArray += [PSCustomObject]@{
                    ColumnName    = $location.ColumnName
                    StackValue    = $PuzzleInput[$i][$location.ColumnLocation]
                    StackLocation = ($baseRowLocation - $i)
                }
            }
        }
    }
    $baseRowLocation += 2 # The empty line between setup and instructions.

    for ($i = $baseRowLocation; $i -le $PuzzleInput.Length - 1; $i++) {
        if ($PuzzleInput[$i].Length) {
            $inputArray = $PuzzleInput[$i].Split(' ')
            $MoveQty = $inputArray[1]
            $MoveFrom = $inputArray[3]
            $MoveTo = $inputArray[5]
            for ($j = 0; $j -lt $MoveQty; $j++) {
                $objectsToMove = $stacksArray | Where-Object { $_.ColumnName -eq $MoveFrom } | Sort-Object -Property StackLocation -Descending 
                $targetColumn = $stacksArray | Where-Object { $_.ColumnName -eq $MoveTo }
                $targetColumnCount = 0
                if ($null -ne $targetColumn ) {
                    if ($null -eq $targetColumn.Count) {
                        # If there's only one object, you get an object.
                        $targetColumnCount = 1
                    }
                    else { $targetColumnCount = $targetColumn.Count } #If there's more than one object, you get an array.
                } 
                if ($null -ne $objectsToMove) {
                    # if($null -eq $objectsToMove.Count) {
                        Write-Host 'MOving ' $objectsToMove.Count
                    # } else {
                        foreach ($objectToMove in $objectsToMove) {
                            $objectToMove.ColumnName = $MoveTo
                            $objectToMove.StackLocation = $targetColumnCount
                            $targetColumnCount++
                        }
                    # }

                    
                }
            }
        }

    }
    $finalOutput = ''
    foreach ($column in $baseRowArray) {
        $TopCrate = $stacksArray | Where-Object { $_.ColumnName -eq $column.ColumnName } | Sort-Object -Property StackLocation -Descending | Select-Object  -First 1
        $finalOutput += $TopCrate.StackValue
    }
    Write-Host 'Puzzle 2: ' $finalOutput
    return $finalOutput
}

Puzzle1 -PuzzleInput $PuzzleInput
#Puzzle2 -PuzzleInput $PuzzleInput
