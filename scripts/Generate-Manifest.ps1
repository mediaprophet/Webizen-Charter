# Generate-Manifest.ps1
# Generates the MANIFEST.n3 file containing all bounded UN instruments and their SHA-256 hashes.

$instrumentsDir = Join-Path $PSScriptRoot "..\un-instruments"
$manifestPath = Join-Path $instrumentsDir "MANIFEST.n3"

# Find all .n3 files excluding MANIFEST.n3, sorted for stable output across hosts.
$n3Files = Get-ChildItem -Path $instrumentsDir -Filter "*.n3" |
    Where-Object { $_.Name -ne "MANIFEST.n3" } |
    Sort-Object -Property Name
$instrumentCount = $n3Files.Count

$manifestContent = @"
@prefix rdfs:    <http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix webizen: <https://w3id.org/webizen/ontology#> .
@prefix xsd:     <http://www.w3.org/2001/XMLSchema#> .

webizen:CharterLegalSubstrate a webizen:InstrumentCorpus ;
    dcterms:title "Webizen Charter - Bound UN/values Human-Rights Instrument Corpus" ;
    webizen:corpusVersion "0.0.1-init" ;
    webizen:generatedByScript "scripts/Generate-Manifest.ps1" ;
    webizen:generationMethod "SHA-256 over each .n3 file excluding MANIFEST.n3, sorted by filename" ;
    webizen:instrumentCount $instrumentCount ;
    webizen:boundInstrument
"@

$boundInstruments = @()

foreach ($file in $n3Files) {
    # Extract filename without extension for the IRI
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $iri = "<https://ns.webcivics.org/values/$baseName#Instrument>"
    
    # Calculate SHA-256 hash
    $hash = (Get-FileHash -Path $file.FullName -Algorithm SHA256).Hash.ToLower()
    
    # We will encode the hash inline as a property of the IRI or as a comment. 
    # To keep it simple and strictly RDF-compliant, we can declare the hash separately later, 
    # but for the `boundInstrument` array we just need the IRI.
    
    $boundInstruments += "    $iri"
    
    # We can also add individual metadata for each instrument below the main block
}

# Join the array with commas
$manifestContent += "`n" + ($boundInstruments -join ",`n") + " .`n`n"

# Now, add the hashes as individual assertions to pin the versions
foreach ($file in $n3Files) {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $iri = "<https://ns.webcivics.org/values/$baseName#Instrument>"
    $hash = (Get-FileHash -Path $file.FullName -Algorithm SHA256).Hash.ToLower()
    
    $manifestContent += "$iri webizen:sha256Hash `"$hash`"^^xsd:string .`n"
}

# Write the content to MANIFEST.n3
$manifestContent | Out-File -FilePath $manifestPath -Encoding UTF8

Write-Host "Successfully generated MANIFEST.n3 with $instrumentCount instruments."
