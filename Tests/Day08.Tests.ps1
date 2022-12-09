if (! (Get-Module -ListAvailable -Name Pester)) {
    Import-Module Pester -PassThru
}

BeforeAll {
    . '../Day08.ps1'
}

Describe 'Puzzle Tests' {

    BeforeEach {
        $Puzzleinput = (Get-Content './Day08-Puzzle.Input.txt')
    }
    It 'Puzzle 1' {
        
        $test = Puzzle1 -PuzzleInput $Puzzleinput
        $test | Should -Be 21
    }
}