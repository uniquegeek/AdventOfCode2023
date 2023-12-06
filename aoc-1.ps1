#The newly-improved calibration document consists of lines of text; 
#each line originally contained a specific calibration value that the Elves now need to recover. 
#On each line, the calibration value can be found by combining the first digit and the last digit (in that order) to form a single two-digit number.
#For example:
$testData = @(
    "1abc2"
    "pqr3stu8vwx"
    "a1b2c3d4e5f"
    "treb7uchet"
)
#In this example, the calibration values of these four lines are 12, 38, 15, and 77. Adding these together produces 142.
#Consider your entire calibration document. What is the sum of all of the calibration values?

$inPath = ".\Documents\Coding Games\AdventCode2023\"
$inName = "aoc-1-input.txt"
$inFile = $inPath + $inName
$content = Get-Content $inFile

[int]$calibSum = 0

#foreach ($d in $testData) {
foreach ($d in $content) {
    $calibPool = $d -replace '\D'   #cabValue.length is 0 if no numbers
    if ($calibPool.Length -ne 0) {
        [int]$calibValue = $calibPool[0] + $calibPool[-1]
    } else {
        [int]$calibValue = 0
    }
    $calibSum = $calibSum + $calibValue
    Write-Host $d","$calibValue","$calibSum
}

#====
# see powershell regex caveat regarding $ here: https://www.regular-expressions.info/powershell.html
