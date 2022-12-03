if (! (Get-Module -ListAvailable -Name Pester)) {
    Import-Module Pester -PassThru
}

BeforeAll {
    . '../Day03.ps1'
}

Describe 'Puzzle Tests' {

    BeforeEach {
        $Puzzleinput = (Get-Content './Day03-Puzzle.Input.txt')
    }
    It 'Puzzle 1' {
        
        $test = Puzzle1 -PuzzleInput $Puzzleinput
        $test | Should -Be 157
    }

    It 'Puzzle 2' {
        $test = Puzzle2 -PuzzleInput $Puzzleinput
        $test | Should -Be 70
    }

}