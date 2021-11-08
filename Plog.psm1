
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
    Param(
         [Parameter(Mandatory=$true, Position=0)]
         [string] $LogString,
         [Parameter(Mandatory=$false, Position=1)]
         [string] $Print,
         [Parameter(Mandatory=$false, Position=2)]
         [string] $Save

    )

    if($Print -eq $true -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][INFO]: $LogString" -B Black -F Gray
        Add-content $Logfile -value "[$Time][INFO]: $LogString"
    }
    Elseif($Print -eq $false -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Add-content $Logfile -value "[$Time][INFO]: $LogString"
    }
    Elseif($Print -eq $true -and $Save -eq $false){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][INFO]: $LogString" -B Black -F Gray
    }
    Elseif($Print -eq $null -and $Save -eq $null){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][INFO]: $LogString" -B Black -F Gray
    }

}


Function LogWarning{
    Param(
         [Parameter(Mandatory=$true, Position=0)]
         [string] $LogString,
         [Parameter(Mandatory=$false, Position=1)]
         [string] $Print,
         [Parameter(Mandatory=$false, Position=2)]
         [string] $Save

    )

    if($Print -eq $true -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][WARNING]: $LogString" -B Black -F Yellow
        Add-content $Logfile -value "[$Time][WARNING]: $LogString"
    }
    Elseif($Print -eq $false -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Add-content $Logfile -value "[$Time][WARNING]: $LogString"
    }
    Elseif($Print -eq $true -and $Save -eq $false){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][WARNING]: $LogString" -B Black -F Yellow
    }
    Elseif($Print -eq $null -and $Save -eq $null){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][WANING]: $LogString" -B Black -F Yellow
    }
}

Function LogError{
    Param(
         [Parameter(Mandatory=$true, Position=0)]
         [string] $LogString,
         [Parameter(Mandatory=$false, Position=1)]
         [string] $Print,
         [Parameter(Mandatory=$false, Position=2)]
         [string] $Save

    )

    if($Print -eq $true -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][ERROR]: $LogString" -B Black -F Red
        Add-content $Logfile -value "[$Time][ERROR]: $LogString"
    }
    Elseif($Print -eq $false -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Add-content $Logfile -value "[$Time][ERROR]: $LogString"
    }
    Elseif($Print -eq $true -and $Save -eq $false){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][ERROR]: $LogString" -B Black -F Red
    }
    Elseif($Print -eq $null -and $Save -eq $null){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][ERROR]: $LogString" -B Black -F Red
    }
}


Function LogDebug{
    Param(
         [Parameter(Mandatory=$true, Position=0)]
         [string] $LogString,
         [Parameter(Mandatory=$false, Position=1)]
         [string] $Print,
         [Parameter(Mandatory=$false, Position=2)]
         [string] $Save

    )

    if($Print -eq $true -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][DEBUG]: $LogString" -B Black -F Magenta
        Add-content $Logfile -value "[$Time][DEBUG]: $LogString"
    }
    Elseif($Print -eq $false -and $Save -eq $true){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Add-content $Logfile -value "[$Time][DEBUG]: $LogString"
    }
    Elseif($Print -eq $true -and $Save -eq $false){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][DEBUG]: $LogString" -B Black -F Magenta
    }
    Elseif($Print -eq $null -and $Save -eq $null){
        $Time = (Get-Date).ToString('hh:mm:ss')
        Write-Host "[$Time][DEBUG]: $LogString" -B Black -F Magenta
    }
}