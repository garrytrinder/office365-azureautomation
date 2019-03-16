# these are ignored
Write-Host "Host"
Write-Information "Information"

# these are not
Write-Warning "Warning!"
Write-Error "Error!"
throw "Bad thing happened"

# output two different ways
$output = "Output"
Write-Output -InputObject $output
$output

# enable logging and tracing options
# logging of progress
for($I = 1; $I -lt 101; $I++ )
{
    Write-Progress -Activity Updating -Status 'Progress->' -PercentComplete $I -CurrentOperation OuterLoop
    for($j = 1; $j -lt 101; $j++ )
    {
        Write-Progress -Id 1 -Activity Updating -Status 'Progress' -PercentComplete $j -CurrentOperation InnerLoop
    }
}

# verbose logging
Write-Verbose "Verbose"