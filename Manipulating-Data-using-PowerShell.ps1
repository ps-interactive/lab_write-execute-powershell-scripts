# Modify Previously Created Variable
$stringVariable = "Hello, Learner!"
$additionalStringVariable = ", Welcome to the LAB"
$stringVariable += $additionalStringVariable
Write-Host "String Variable: $stringVariable"


## Modify Previously Created Hashtable Variables
# Add a New Column
$hashtable["Occupation"] = "Engineer"
$hashtable

# Update an Existing Key Value
$hashtable["Age"] = "31"
$hashtable

# Add a New Column to a Nested Hashtable
foreach ($key in $employeesWithIdentifiers.Keys) {
    $employeesWithIdentifiers[$key]["Country"] = "USA"
}

$employeesWithIdentifiers

# Add a New Row toi the Nested Hashtable
$employeesWithIdentifiers["EID47389"] = @{
    "Name"       = "Alice Brown"
    "Age"        = 32
    "Department" = "Human Resources"
    "Country" = "UK"
}

$employeesWithIdentifiers


## Create Variables Containing Data
# Create a JSON Variable Loaded Static with Data
$jsonData = @"
{
    "users": [
        {"id": 1, "name": "Alice"},
        {"id": 2, "name": "Bob"},
        {"id": 3, "name": "Charlie"},
        {"id": 4, "name": "Dave"},
        {"id": 5, "name": "Eve"},
        {"id": 6, "name": "Frank"},
        {"id": 7, "name": "Grace"},
        {"id": 8, "name": "Hannah"},
        {"id": 9, "name": "Isaac"},
        {"id": 10, "name": "Jack"}
    ]
}
"@

# Create a XML Variable Loaded Static with Data
$xmlData = @"
<users>
    <user id="1"><name>Alice</name></user>
    <user id="2"><name>Bob</name></user>
    <user id="3"><name>Charlie</name></user>
    <user id="4"><name>Dave</name></user>
    <user id="5"><name>Eve</name></user>
    <user id="6"><name>Frank</name></user>
    <user id="7"><name>Grace</name></user>
    <user id="8"><name>Hannah</name></user>
    <user id="9"><name>Isaac</name></user>
    <user id="10"><name>Jack</name></user>
</users>

"@

# Create a CSV Variable Loaded Static with Data
$csvData = @"
    id,name
    1,Alice
    2,Bob
    3,Charlie
    4,Dave
    5,Eve
    6,Frank
    7,Grace
    8,Hannah
    9,Isaac
    10,Jack
"@

$jsonData
$xmlData
$csvData



# Create a JSON Variable with Imported Data
$jsonImportPath = ".\Data\Data.json"
$jsonImportData = Get-Content -Path $jsonImportPath -Raw | ConvertFrom-Json

# Create a XML Variable with Imported Data
$xmlImportPath = ".\Data\Data.xml"
$xmlImportData = [xml](Get-Content -Path $xmlImportPath)

# Create a CSV Variable with Imported Data
$csvImportPath = ".\Data\Data.csv"
$csvImportData = Import-Csv -Path $csvImportPath

$jsonImportData
$xmlImportData
$csvImportData



# Loop the JSON Data in both Variables Using ForEach-Object
$jsonData.users | ForEach-Object {
    Write-Host "ID: $($_.id), Name: $($_.name)"
}

$jsonImportData.users | ForEach-Object {
    Write-Host "ID: $($_.id), Name: $($_.name)"
}

# Loop the JSON Data in both Variables Using Foreach
foreach ($user in $jsonData.users) {
    Write-Host "ID: $($user.id), Name: $($user.name)"
}

foreach ($user in $jsonImportData.users) {
    Write-Host "ID: $($user.id), Name: $($user.name)"
}


# Modify the XML Loaded Data and Update
$xmlImportPath = ".\Data\Data.xml"
$xmlImportData = [xml](Get-Content -Path $xmlImportPath)

# Loop Through and View the Data
foreach ($employee in $xmlImportData.employees.employee) {
    Write-Host "ID: $($employee.id), Name: $($employee.name), Country: $($employee.country)" 
}

# Loop Through and Update the Data
foreach ($employee in $xmlImportData.employees.employee) {
    $employee.country = "USA"
}

# Save the Modified XML back to the File
$xmlImportData.Save($xmlImportPath)

# Display the Modified XML Content
$xmlImportData.OuterXml






