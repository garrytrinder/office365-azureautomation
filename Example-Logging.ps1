param (
    # Parameter help description
    [Parameter(Mandatory=$false)]
    [String] $Param = "Input"
)

# these are ignored
Write-Host "Host"
Write-Information "Information"

# output (two ways)
# Long way
$output = "Output"
Write-Output -InputObject $output
# Short way
$output

# logging of progress
# enable logging and tracing options
for ($i = 1; $i -le 10; $i++ )
{
    Write-Progress -Activity "Search in Progress" -Status "$i% Complete:" -PercentComplete $i;
}

# warnings
Write-Warning "Warning!"

# verbose logging
# enable logging and tracing options
Write-Verbose "Verbose"

# errors and exceptions
Write-Error "Error!"
throw "Bad thing happened"