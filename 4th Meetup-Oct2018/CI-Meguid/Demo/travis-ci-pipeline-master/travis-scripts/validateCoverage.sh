xcrun xccov view BuildFolder/Logs/Test/*.xcresult/3_Test/action.xccovreport --json > coverage.json
coverage=`swift Parser.swift coverage.json`
echo $coverage
if [ $coverage -lt 70 ];
then
exit 1
else
exit 0
fi
