if (! (Get-Module -ListAvailable -Name Pester)) {
    Import-Module Pester -PassThru
}

BeforeAll {
    . '../Day01.ps1'
}

Describe 'Puzzle Tests' {

    BeforeEach {
        $Puzzleinput = (Get-Content './Day01-Puzzle1.Input.txt')
    }
    It 'Puzzle 1' {
        
        $test = Puzzle1 -PuzzleInput $Puzzleinput
        $test | Should -Be 24000
    }

    It 'Puzzle 2' {
        $test = Puzzle2 -PuzzleInput $PuzzleInput
        $test | Should -Be 41000
    }
}

