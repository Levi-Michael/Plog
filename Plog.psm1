$script:Date = (Get-Date).ToString('dd-MM-yyyy')

Function Start-Log{

    Param(
         [Parameter(Mandatory=$true, Position=0)]
         [string] $Path,
         [Parameter(Mandatory=$true, Position=1)]
         [string] $Name,
         [Parameter(Mandatory=$false, Position=2)]
         [string] $Transcript
    )

    $Script:Logfile = "$Path\$Name"

    If($Transcript -eq $true){
        Start-Transcript -Path $Path\$($Name.Split(".")[0])-Transcript.txt -Force -Append
    
    }

    $Time = (Get-Date).ToString('hh:mm:ss')
    Log-Info -LogString "----------------------------------------------------------------------" -Print $true -Save $true
    Log-Info -LogString "Log created by: $env:UserName from Computer: $env:computername ." -Print $true -Save $true
    Log-Info -LogString "Log Created at: $Date $Time ." -Print $true -Save $true
    Log-Info -LogString "Log path set to $Logfile" -Print $true -Save $true
    Log-Info -LogString "----------------------------------------------------------------------" -Print $true -Save $true
    [Environment]::NewLine
}

Function Log-BreakLine{
    [Environment]::NewLine
    Write-Host "----------------------------------------------------------------------" -B Black -F Yellow
    [Environment]::NewLine

}

Function Log-Info{
    Param(
         [Parameter(Mandatory=$true, Position=0)]
         [string] $LogString,
         [Parameter(Mandatory=$false, Position=1)]
         [string] $Print,
         [Parameter(Mandatory=$false, Position=2)]
         [string] $Save

    )

    If($Print -eq $true -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][INFO]: $LogString" -B Black -F Gray
        Add-content $Logfile -value "[$Time][INFO]: $LogString"

        $Row = "" | Select ID,Time,LogLevel,Log
        $Row.ID = $ID++
        $Row.Time = $Time
        $Row.LogLevel = "INFO"
        $Row.Log = $LogString
        $Array += $Row
    }
    ElseIf($Print -eq $false -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Add-content $Logfile -value "[$Time][INFO]: $LogString"
    }
    ElseIf($Print -eq $true -and $Save -eq $false){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][INFO]: $LogString" -B Black -F Gray
    }
    ElseIf($Print -eq $null -and $Save -eq $null){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][INFO]: $LogString" -B Black -F Gray
    } 
}


Function Log-Warning{
    Param(
         [Parameter(Mandatory=$true, Position=0)]
         [string] $LogString,
         [Parameter(Mandatory=$false, Position=1)]
         [string] $Print,
         [Parameter(Mandatory=$false, Position=2)]
         [string] $Save

    )

    If($Print -eq $true -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][WARNING]: $LogString" -B Black -F Yellow
        Add-content $Logfile -value "[$Time][WARNING]: $LogString"
    }
    ElseIf($Print -eq $false -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Add-content $Logfile -value "[$Time][WARNING]: $LogString"
    }
    ElseIf($Print -eq $true -and $Save -eq $false){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][WARNING]: $LogString" -B Black -F Yellow
    }
    ElseIf($Print -eq $null -and $Save -eq $null){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][WARNING]: $LogString" -B Black -F Yellow
    }
}

Function Log-Error{
    Param(
         [Parameter(Mandatory=$true, Position=0)]
         [string] $LogString,
         [Parameter(Mandatory=$false, Position=1)]
         [string] $Print,
         [Parameter(Mandatory=$false, Position=2)]
         [string] $Save

    )

    If($Print -eq $true -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][ERROR]: $LogString" -B Black -F Red
        Add-content $Logfile -value "[$Time][ERROR]: $LogString"
    }
    ElseIf($Print -eq $false -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Add-content $Logfile -value "[$Time][ERROR]: $LogString"
    }
    ElseIf($Print -eq $true -and $Save -eq $false){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][ERROR]: $LogString" -B Black -F Red
    }
    ElseIf($Print -eq $null -and $Save -eq $null){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][ERROR]: $LogString" -B Black -F Red
    }
}


Function Log-Debug{
    Param(
         [Parameter(Mandatory=$true, Position=0)]
         [string] $LogString,
         [Parameter(Mandatory=$false, Position=1)]
         [string] $Print,
         [Parameter(Mandatory=$false, Position=2)]
         [string] $Save

    )

    If($Print -eq $true -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][DEBUG]: $LogString" -B Black -F Magenta
        Add-content $Logfile -value "[$Time][DEBUG]: $LogString"
    }
    ElseIf($Print -eq $false -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Add-content $Logfile -value "[$Time][DEBUG]: $LogString"
    }
    ElseIf($Print -eq $true -and $Save -eq $false){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][DEBUG]: $LogString" -B Black -F Magenta
    }
    ElseIf($Print -eq $null -and $Save -eq $null){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][DEBUG]: $LogString" -B Black -F Magenta
    }
}


Function Log-Action{
    Param(
         [Parameter(Mandatory=$true, Position=0)]
         [string] $LogString,
         [Parameter(Mandatory=$false, Position=1)]
         [string] $Print,
         [Parameter(Mandatory=$false, Position=2)]
         [string] $Save

    )

    If($Print -eq $true -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][ACTION]: $LogString" -B Black -F Blue
        Add-content $Logfile -value "[$Time][ACTION]: $LogString"
    }
    ElseIf($Print -eq $false -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Add-content $Logfile -value "[$Time][ACTION]: $LogString"
    }
    ElseIf($Print -eq $true -and $Save -eq $false){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][ACTION]: $LogString" -B Black -F Blue
    }
    ElseIf($Print -eq $null -and $Save -eq $null){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][ACTION]: $LogString" -B Black -F Blue
    }
}


Function Log-Success{
    Param(
         [Parameter(Mandatory=$true, Position=0)]
         [string] $LogString,
         [Parameter(Mandatory=$false, Position=1)]
         [string] $Print,
         [Parameter(Mandatory=$false, Position=2)]
         [string] $Save

    )

    If($Print -eq $true -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][SUCCESS]: $LogString" -B Black -F Green
        Add-content $Logfile -value "[$Time][SUCCESS]: $LogString"
    }
    ElseIf($Print -eq $false -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Add-content $Logfile -value "[$Time][SUCCESS]: $LogString"
    }
    ElseIf($Print -eq $true -and $Save -eq $false){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][SUCCESS]: $LogString" -B Black -F Green
    }
    ElseIf($Print -eq $null -and $Save -eq $null){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][SUCCESS]: $LogString" -B Black -F Green
    }
}

Function Read-Log{
    Param(
         [Parameter(Mandatory=$true, Position=0)]
         [string] $Path,
         [Parameter(Mandatory=$false, Position=1)]
         [string] $LogLevel

    )

    $Content = Get-Content -Path $Path

    If($LogLevel -eq $null -or $LogLevel -eq "" -or $LogLevel -like "all"){
        
        $Content
    
    }

    ElseIf($LogLevel -like "INFO"){
        Select-String -Path $Path -Pattern "INFO"
    
    }

    ElseIf($LogLevel -like "WARNING"){
        Select-String -Path $Path -Pattern "WARNING"
    
    }

    ElseIf($LogLevel -like "ERROR"){
        Select-String -Path $Path -Pattern "ERROR"
    
    }

    ElseIf($LogLevel -like "DEBUG"){
        Select-String -Path $Path -Pattern "DEBUG"
    
    }

    ElseIf($LogLevel -like "ACTION"){
        Select-String -Path $Path -Pattern "ACTION"
    
    }

    ElseIf($LogLevel -like "SUCCESS"){
        Select-String -Path $Path -Pattern "SUCCESS"
    
    }


}


Function Stop-Log{
    Stop-Transcript

}

