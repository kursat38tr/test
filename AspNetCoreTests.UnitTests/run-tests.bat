dotnet test --logger "trx;LogFileName=TestResults.trx" --logger "xunit;LogFileName=TestResults.xml" --results-directory ./BuildReports/UnitTests /p:CollectCoverage=true /p:CoverletOutput=BuildReports\Coverage\ /p:CoverletOutputFormat=cobertura /p:Exclude="[xunit.*]* /p:publishTestResults=true

REM tools\reportgenerator.exe "-reports:BuildReports\Coverage\coverage.cobertura.xml" "-targetdir:BuildReports\Coverage" -reporttypes:HTML;HTMLSummary 
dotnet %USERPROFILE%\.nuget\packages\reportgenerator\5.1.6\tools\net6.0\ReportGenerator.dll "-reports:BuildReports\Coverage\coverage.cobertura.xml" "-targetdir:BuildReports\Coverage" -reporttypes:HTML;HTMLSummary

start BuildReports\Coverage\index.htm