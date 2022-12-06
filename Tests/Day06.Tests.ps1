if (! (Get-Module -ListAvailable -Name Pester)) {
    Import-Module Pester -PassThru
}

BeforeAll {
    . '../Day06.ps1'
}


Describe 'Puzzle Tests' {

    It 'Puzzle 1' {        
        $test = Puzzle1 -PuzzleInput 'mjqjpqmgbljsphdztnvjfqwrcgsmlb' -UniqueCount 4
        $test | Should -Be 7
    }

    It 'Puzzle 1 Example 2' {
        $test = Puzzle1 -PuzzleInput 'bvwbjplbgvbhsrlpgdmjqwftvncz' -UniqueCount 4
        $test | Should -Be 5
    }

    It 'Puzzle 2' {
        $test = Puzzle2 -PuzzleInput 'mjqjpqmgbljsphdztnvjfqwrcgsmlb' -UniqueCount 14
        $test | Should -Be 19
    }

}