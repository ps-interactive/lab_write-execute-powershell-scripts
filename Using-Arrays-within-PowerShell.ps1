## String Variable
$stringVariable = "Hello, Learner!"
Write-Host "String Variable: $stringVariable"

## Integer and Double Variable
$integerVariable = 10
$doubleVariable = 10.5
Write-Host "Integer: $integerVariable, Double: $doubleVariable"

## Boolean and DateTime Variable
$booleanVariable = $true
$dateTimeVariable = Get-Date
Write-Host "Boolean: $booleanVariable"
Write-Host "DateTime: $dateTimeVariable"

## Calculating Variables
$variableOne = 10
$variableTwo = 20
Write-Host "Answer: $variableOne  + $variableTwo"
Write-Host "Answer: $($variableOne + $variableTwo)"

## Array Variable
$stringArrayVariable = "Red", "Blue", "Green"
Write-Host "Array: $stringArrayVariable"

## Dynamic Array Variable
$dynamicArrayVariable = @()
$dynamicArrayVariable += 1
$dynamicArrayVariable += 2
$dynamicArrayVariable += 3
$dynamicArrayVariable
Write-Host "Dynamic Array: $($dynamicArrayVariable -join ', ')"

## Hashtable Variable
$hashtable = @{"Name" = "John Doe"; "Age" = "30"; "City" = "New York"}
$hashtable
$hashtable["Name"]

## Nested Hashtable Variables with Identifiers
$employeesWithIdentifiers = @{
    "EID00932" = @{"Name" = "John Doe"; "Age" = 30; "Department" = "Marketing"}
    "EID34467" = @{"Name" = "Jane Smith"; "Age" = 25; "Department" = "Sales"}
    "EID09858" = @{"Name" = "Bill Johnson"; "Age" = 40; "Department" = "IT"}
}
$employeesWithIdentifiers
$employeesWithIdentifiers["EID00932"]
$employeesWithIdentifiers["EID00932"]["Name"]

## Nested Hashtable Variables with Indexes
$employeesWithIndexes = @(
    @{"Name" = "John Doe"; "Age" = 30; "Department" = "Marketing"}
    @{"Name" = "Jane Smith"; "Age" = 25; "Department" = "Sales"}
    @{"Name" = "Bill Johnson"; "Age" = 40; "Department" = "IT"}
)
$employeesWithIndexes
$employeesWithIndexes[0]
$employeesWithIndexes[0]["Name"]

cls

 





