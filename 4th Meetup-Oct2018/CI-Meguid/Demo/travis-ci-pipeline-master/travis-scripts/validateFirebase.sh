if gcloud alpha firebase test ios run --test MyTest.zip --timeout 2m
then
echo "Test matrix successfully finished"
else
echo "Test matrix exited abnormally with non-zero exit code: " $?
fi
