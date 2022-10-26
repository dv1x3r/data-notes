# Azure DevOps - BI Tabular

## Data Factory CI

1. Agent Specification: windows-2019
2. Get sources: adf_publish from Azure Repos Git
3. Publish Pipeline Artifacts: /data-factory -> adf_publish

## Database and Tabular CI

1. Agent Specification: windows-2019
2. Get sources: master from Azure Repos Git
3. Command Line Script: Tabular Prepare

```bat
@echo off

set FOLDER_TE="$(System.DefaultWorkingDirectory)\DevOps\TabularEditor"
set FOLDER_SLN="$(System.DefaultWorkingDirectory)\ASTab"

cd %FOLDER_SLN%

FOR /D %%M in ("*") DO (
    echo %%~nxM

    IF EXIST "%%M\Model.bim" (
        "%FOLDER_TE%\TabularEditor.exe" "%%M\Model.bim" ^
        -S "Model.Description=\"%%~nxM\";" ^
        "%FOLDER_TE%\ExportDescriptions.cs" ^
        "%FOLDER_TE%\ExportMembers.cs" ^
        "%FOLDER_TE%\ExportRLS.cs" ^
    )

    echo __________________________________________________
    echo __________________________________________________
    echo:
    echo:
)
```

4. Visual Studio build: Database .sln
5. Publish Pipeline Artifacts: /ASTab -> tabular
6. Publish Pipeline Artifacts: /SQL/bin/Debug -> database
7. Publish Pipeline Artifacts: /DevOps -> tools

## Release Pipeline

1. Agent Specification: windows-2019
2. Azure Key Vault: *
3. Azure PowerShell: Data Factory Pre Deployment
   - Script Path: `$(System.DefaultWorkingDirectory)/Database and Tabular/tools/PowerShell/pre-post-datafactory.ps1`
   - Script Arguments: `-armTemplate "$(System.DefaultWorkingDirectory)/Data Factory/adf_publish/ARMTemplateForFactory.json" -ResourceGroupName "<RESOURCE_GROUP_NAME>" -DataFactoryName "<DATA_FACTORY_NAME>" -predeployment $true -deleteDeployment $false`
4. ARM template deployment: Data Factory Deployment
   - Create or update resource group
   - Template: `$(System.DefaultWorkingDirectory)/Data Factory/adf_publish/ARMTemplateForFactory.json`
   - Template parameters: `$(System.DefaultWorkingDirectory)/Data Factory/adf_publish/ARMTemplateParametersForFactory.json`
   - Override template parameters: `<ARMTemplateParametersForFactory.json>`
5. Azure PowerShell: Data Factory Post Deployment
   - Script Path: `$(System.DefaultWorkingDirectory)/Database and Tabular/tools/PowerShell/pre-post-datafactory.ps1`
   - Script Arguments: `-armTemplate "$(System.DefaultWorkingDirectory)/Data Factory/adf_publish/ARMTemplateForFactory.json" -ResourceGroupName "<RESOURCE_GROUP_NAME>" -DataFactoryName "<DATA_FACTORY_NAME>" -predeployment $true -deleteDeployment $true`
6. Azure SQL Database Deployment
   - DACPAC File: `$(System.DefaultWorkingDirectory)/Database and Tabular/database/sdp.dacpac`
   - Additional SqlPackage.exe Arguments: `/p:BlockOnPossibleDataLoss=false /p:GenerateSmartDefaults=true`
7. Azure PowerShell: Invoke update_staging
    - Inline Script: `Invoke-AzDataFactoryV2Pipeline -DataFactoryName "<DATA_FACTORY_NAME>" -ResourceGroupName "<RESOURCE_GROUP_NAME>" -PipelineName "<STAGING_UPDATE_PIPELINE_NAME>"`
8. Command Line Script: Tabular Deployment

```bat
@echo off

set FOLDER_TE=$(System.DefaultWorkingDirectory)\Database and Tabular\tools\TabularEditor
set FOLDER_SLN=$(System.DefaultWorkingDirectory)\Database and Tabular\tabular

cd %FOLDER_SLN%

FOR /D %%M in ("*") DO (
    echo %%~nxM

    IF EXIST "%%M\Model.bim" (
        "%FOLDER_TE%\TabularEditor.exe" "%%M\Model.bim" ^
        -D "$(asazure-connection-string)" "%%~nxM" ^
        -S "%FOLDER_TE%\ConnectionStringCleanup.cs" ^
        -C "Placeholder" "Data Source=$(sql-server-address);Initial Catalog=$(sql-database-name);Persist Security Info=True;User ID=$(sql-admin-username);Password=$(sql-admin-password);Encrypt=True;TrustServerCertificate=False" ^
        -R -M -O -P -E -V
    )

    echo __________________________________________________
    echo __________________________________________________
    echo:
    echo:
)
```

9. Azure file copy: Tabular Metadata Upload
   - Source: `$(System.DefaultWorkingDirectory)/Database and Tabular/tabular/TabularMetadata`
