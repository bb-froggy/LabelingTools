<#
FindLabeledDocuments
Version: 20220316
Christoph Hannebauer, glueckkanja-gab AG <christoph.hannebauer@glueckkanja-gab.com>

Searches a given path for all files that are labeled with a specific Sensitivity Label

	.PARAMETER Path
    The path to search in
	
	.PARAMETER Labels
    A list of labels to search for

	.EXAMPLE
    .\FindLabeledDocuments.ps1 -Path "C:\" -Labels "Confidential", "Strictly Confidential" 1>businessfiles.txt 2>error.txt

#>
param
( 
[Parameter(Position=0,Mandatory=$true,ValueFromPipeline=$false,HelpMessage='The path to search in')][string]$Path,
[Parameter(Position=1,Mandatory=$true,ValueFromPipeline=$false,HelpMessage='A list of labels to search for')][string[]]$Labels
)

function outputFileIfLabeled($status) {
    if ($Labels.Contains($status.MainLabelName)) {
        "$($status.MainLabelName): $($status.FileName)"
    }
}

$aipErrors = @()
Get-AIPFileStatus -Path $Path -ErrorVariable +aipErrors -ErrorAction SilentlyContinue | Where-Object { outputFileIfLabeled($_) }

foreach ($errorAccess in $aipErrors) {
    "$($errorAccess.CategoryInfo.Reason): $($errorAccess.CategoryInfo.TargetName)"
}
