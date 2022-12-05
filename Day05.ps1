$PuzzleInput = Get-Content './Inputs/Day05.txt'

function Puzzle1 {
    param (
        $PuzzleInput
    )
    $MatchCount = 0
    $baseRowLocation = 0
    $baseRowArray = @()
    for($i = 0; $i -lt $PuzzleInput.Count; $i++) {
        if($PuzzleInput[$i] -like ' 1   2   3*') {
            # write-host $PuzzleInput[$i].Length
            $baseRow = $PuzzleInput[$i]  -replace '\s','' #remove the white space
            $baseRowLocation = $i
            for($j = 0; $j -le $PuzzleInput[$i].Length; $j++) {
                if($PuzzleInput[$i][$j] -match '^[0-9]') { #get numbers
                    # write-host 'aa' $PuzzleInput[$i][$j] $j
                    $baseRowArray+= [$PuzzleInput[$i]][$j]
                }
            }
            break
        }
    }
    $baseRowArray
    $stacksArray = @()
    # My input had no empty columns, so this works
    # for($i = 0; $i -lt $baseRowLocation; $i++) {
    #     $string = $PuzzleInput[$i]  -replace '\s',''
    #     $string = $string.replace('[', '')
    #     $string = $string.replace(']', '')
    #     write-host 'string' $string
    # }
    # $rowCount = $PuzzleInput  | Where-Object { $_ -like ' 1   2   3*'} | Select-Object 
    # $baseRow = Out-String -InputObject $rowCount
    # $baseRow = $baseRow  -replace '\s',''
    # $a = 'awsdefasdf'
    # write-host "rc"  $baseRow
    #[string]$baseRow = $rowCount.Trim()
    # write-Host "SR" $rowCount.GetType()
    Write-Host 'Puzzle 1: ' $MatchCount
    return $rowCount
}

function Puzzle2 {
    param (
        $PuzzleInput
    )
    $MatchCount = 0

    Write-Host 'Puzzle 2: ' $MatchCount
    return $MatchCount
}

Puzzle1 -PuzzleInput $PuzzleInput
#Puzzle2 -PuzzleInput $PuzzleInput
