# similar touch function in powershell
Function touch
{
    $file = $args[0]
    if($file -eq $null) {
        throw "No filename supplied"
    }

    if(Test-Path $file)
    {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else
    {
        echo $null > $file
    }
}

# change the color of the error
$host.PrivateData.ErrorForegroundColor = 'White'



# similar touch function in powershell
Function touch
{
    $file = $args[0]
    if($file -eq $null) {
        throw "No filename supplied"
    }

    if(Test-Path $file)
    {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else
    {
        echo $null > $file
    }
}

# change the color of the error
$host.PrivateData.ErrorForegroundColor = 'White'

# Set-PSReadlineOption -TokenKind comment -ForegroundColor white
# Set-PSReadlineOption -TokenKind none -ForegroundColor white
Set-PSReadlineOption -TokenKind command -ForegroundColor white
# Set-PSReadlineOption -TokenKind parameter -ForegroundColor white
# Set-PSReadlineOption -TokenKind variable -ForegroundColor white
# Set-PSReadlineOption -TokenKind type -ForegroundColor white
# Set-PSReadlineOption -TokenKind number -ForegroundColor white
# Set-PSReadlineOption -TokenKind string -ForegroundColor white
# Set-PSReadlineOption -TokenKind operator -ForegroundColor white
# Set-PSReadlineOption -TokenKind member -ForegroundColor white
