
Function LogPath{

    Param(
         [Parameter(Mandatory=$true, Position=0)]
         [string] $Path,
         [Parameter(Mandatory=$true, Position=1)]
         [string] $Name
    )


    $Time = (Get-Date).ToString('hh:mm:ss')
    $Script:Logfile = "$Path\$Name"

    Write-Host "[$Time][INFO]: Log created by: $env:UserName from Computer: $env:computername at: $Time " -B Black -F Gray 
    Add-content $Logfile -value "[$Time][INFO]: Log created by: $env:UserName from Computer: $env:computername at: $Time "
    Write-Host "[$Time][INFO]: Log path set to $Logfile" -B Black -F Gray 
    Add-content $Logfile -value "[$Time][INFO]: Log path set to $Logfile"

}

Function LogInfo{
    Param ([string]$logstring)

    $Time = (Get-Date).ToString('hh:mm:ss')
    Add-content $Logfile -value "[$Time][INFO]: $logstring"
    Write-Host "[$Time][INFO]: $logstring" -B Black -F Gray
}


Function LogWarning{
    Param ([string]$logstring)

    $Time = (Get-Date).ToString('hh:mm:ss')
    Add-content $Logfile -value "[$Time][WARNING]: $logstring"
    Write-Host "[$Time][WARNING]: $logstring" -B Black -F Yellow
}

Function LogError{
    Param ([string]$logstring)

    $Time = (Get-Date).ToString('hh:mm:ss')
    Add-content $Logfile -value "[$Time][ERROR]: $logstring"
    Write-Host "[$Time][ERROR]: $logstring" -B Black -F Red
}


Function LogDebug{
    Param ([string]$logstring)

    $Time = (Get-Date).ToString('hh:mm:ss')
    Add-content $Logfile -value "[$Time][DEBUG]: $logstring"
    Write-Host "[$Time][DEBUG]: $logstring" -B Black -F Magenta
}