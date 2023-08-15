## Create a Basic Function with Simple Output
function Show-Message {
    Write-Output "Hello, World!"
}

Show-Message


## Add Parameters to the Function
function Show-Message {
    param(
        [string]$Name
    )
    Write-Output "Hello, $Name!"
}

Show-Message -Name "Alice"


## Add Default Parameter Value and Multiple Parameters
function Show-Message {
    param(
        [string]$Name = "World",
        [string]$Greeting = "Hello"
    )
    Write-Output "$Greeting, $Name!"
}

Show-Message
Show-Message -Name "Dave"
Show-Message -Name "Lucy" -Greeting "Hi"


## Add Conditional Logic
function Show-Message {
    param(
        [string]$Name = "World",
        [string]$Greeting
    )
    
    if (-not $Greeting) {
        $currentHour = (Get-Date).Hour
        $Greeting = if ($currentHour -lt 12) {
            "Good morning"
        } elseif ($currentHour -lt 18) {
            "Good afternoon"
        } else {
            "Good evening"
        }
    }

    Write-Output "$Greeting, $Name!"
}

Show-Message
Show-Message -Name "Lisa"
Show-Message -Name "Liam" -Greeting "Hi"

## Retrieve Basic System Information
Get-CimInstance -ClassName Win32_OperatingSystem

## Filter the Data
Get-CimInstance -ClassName Win32_DiskDrive -Filter "MediaType='Fixed hard disk media'"

## Use Where-Object for Advanced Filtering
Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object { $_.Size -gt 100GB }

## Use ForEach-Object to Manipulate or Act on Each Instance
Get-CimInstance -ClassName Win32_Service | ForEach-Object {
    [PSCustomObject]@{
        'Service Name'  = $_.Name
        'Display Name'  = $_.DisplayName
        'Status'        = $_.Status
        'Start Mode'    = $_.StartMode
    }
} | Format-Table -AutoSize


## Combining CIM Classes
$topProcess = Get-CimInstance -ClassName Win32_PerfFormattedData_PerfProc_Process | 
              Sort-Object WorkingSet -Descending | 
              Select-Object -First 1

$processDetail = Get-CimInstance -ClassName Win32_Process | 
                 Where-Object { $_.ProcessId -eq $topProcess.IDProcess }

[PSCustomObject]@{
    'Process Name' = $processDetail.Name
    'Memory (MB)'  = [math]::Round($topProcess.WorkingSet / 1MB, 2)
}


## Retrieve System Information
function Get-SystemInformation {
    $OS = Get-CimInstance Win32_OperatingSystem
    $Processor = Get-CimInstance Win32_Processor
    $Memory = Get-CimInstance Win32_PhysicalMemory

    $MemoryInfo = ($Memory | ForEach-Object {
        "Size: $([math]::Round($_.Capacity / 1GB, 2)) GB, Manufacturer: $($_.Manufacturer), Speed: $($_.Speed) MHz"
    }) -join '; '

    # Output the retrieved information
    [PSCustomObject]@{
        'OS Name' = $OS.Caption
        'OS Version' = $OS.Version
        'Processor Name' = $Processor.Name
        'Total Physical Memory (GB)' = [math]::Round($OS.TotalVisibleMemorySize / 1MB, 2)
        'Free Physical Memory (GB)' = [math]::Round($OS.FreePhysicalMemory / 1MB, 2)
        'Memory Modules' = $MemoryInfo
    }
}

# Call the Function
Get-SystemInformation | Format-Table -AutoSize



## Import CSV Data and Modify
function Invoke-DataChange {
    param(
        [string]$FilePath
    )

    $data = Import-Csv -Path $FilePath

    $updatedData = $data | ForEach-Object {
        [PSCustomObject]@{
            'ID'        = $_.ID
            'Name'      = $_.Name
            'Age'       = "$($_.Age) years old"
            'Company'   = $_.Company
            'Department'= $_.Department
            'City'      = $_.City
            'State'     = $_.State
            'Country'   = $_.Country
            'Status'    = if ($_.Age -lt 30) { "Young" } else { "Experienced" }
        }
    }
    $updatedData
}

# Call the function
Invoke-DataChange -FilePath ".\Data\DataUpdate.csv" | Format-Table -AutoSize

