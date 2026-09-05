[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$Root = Split-Path $PSScriptRoot -Parent
$Skill = Join-Path $Root "verify-and-refine/SKILL.md"
$Content = Get-Content -LiteralPath $Skill -Raw
if ($Content -notmatch '(?s)\A---\r?\nname: [a-z0-9-]+\r?\ndescription: [^\r\n]+\r?\n---') {
    throw 'Invalid skill name or description frontmatter.'
}
$Agent = Join-Path (Split-Path $Skill -Parent) 'agents/openai.yaml'
if (-not (Test-Path -LiteralPath $Agent -PathType Leaf)) { throw 'Missing agent metadata.' }
foreach ($File in Get-ChildItem -LiteralPath $Root -Filter '*.ps1' -Recurse -File) {
    $Tokens = $null; $Errors = $null
    $null = [System.Management.Automation.Language.Parser]::ParseFile($File.FullName, [ref]$Tokens, [ref]$Errors)
    if ($Errors.Count) { throw "Parser errors in $($File.FullName): $Errors" }
}
Write-Output 'Skill package validation passed.'
