# Simple Calculator

Write-Host "================================"
Write-Host "      Simple Calculations       "
Write-Host "================================"

$Title = "Operation Selection"
$Question = "Choose your mathematical operation"

$UserChoices = @(
    New-Object System.Management.Automation.Host.ChoiceDescription "&Add", "Addition Operation"
    New-Object System.Management.Automation.Host.ChoiceDescription "&Subtract", "Subtraction Operation"
    New-Object System.Management.Automation.Host.ChoiceDescription "&Multiply", "Multiplication Operation"
    New-Object System.Management.Automation.Host.ChoiceDescription "&Divide", "Division Operation"
    New-Object System.Management.Automation.Host.ChoiceDescription "&Exit", "Closes the Calculator"
)

$UserDecision = $Host.UI.PromptForChoice($Title, $Question, $UserChoices, 0)

if ($UserDecision -eq 4) {
    Exit
}

$FirstNum = Read-Host -Prompt "Enter your first number"
$SecondNum = Read-Host -Prompt "Enter your second number"

function Get-CalculationResult {
    # The function first converts the 2 integers/decimals from string to 'double' value.
    $FirstNumConvert = [double]$FirstNum
    $SecondNumConvert = [double]$SecondNum
    
    switch ($UserDecision) {
        0 {
            # Addition
            $Result = $FirstNumConvert + $SecondNumConvert
            Write-Host $Result
        }
        1 {
            # Subtraction
            $Result = $FirstNumConvert - $SecondNumConvert
            Write-Host $Result
        }
        2 {
            # Multiplication
            $Result = $FirstNumConvert * $SecondNumConvert
            Write-Host $Result
        }
        3 {
            # Division
            if ($SecondNumConvert -eq 0) {
                Write-Host "Cannot divide by 0."
            } else {
                $Result = $FirstNumConvert / $SecondNumConvert
                Write-Host $Result
            }
        }
        Default {
            Write-Host "Invalid operation."
        }
    }
}

 
While ($true) {
    # Checks that the user's input is an integer or decimal.
    If (($FirstNum -as [double]) -and ($SecondNum -as [double])) {
        Get-CalculationResult
        Break #Stops the loop after the calculation finishes.
    } else {
        # Prompts user to re-enter a valid integer or decimal if the above is not true.
        Write-Host "One or both inputs are invalid. Please enter integers only"

        $FirstNum = Read-Host -Prompt "Enter your first number"
        $SecondNum = Read-Host -Prompt "Enter your second number"
    }
}

