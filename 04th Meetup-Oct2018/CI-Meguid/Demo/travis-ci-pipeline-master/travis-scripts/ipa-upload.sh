
OUTPUTDIR="IPA"
RELEASE_DATE=`date '+%Y-%m-%d %H:%M:%S'`
RELEASE_NOTES="Build: $TRAVIS_BUILD_NUMBER Uploaded: $RELEASE_DATE"

HOCKEY_ID=""
HOCKEY_TOKEN=""

if [ ! -z "$HOCKEY_ID" ] && [ ! -z "$HOCKEY_TOKEN" ]; then

echo ""
echo "***************************"
echo "* Uploading to Hockeyapp  *"
echo "***************************"

curl https://rink.hockeyapp.net/api/2/apps/$HOCKEY_ID/app_versions \
-F status="2" \
-F notify="0" \
-F notes="$RELEASE_NOTES" \
-F notes_type="0" \
-F tags="beta" \
-F ipa="@$OUTPUTDIR/travis-ci-ex.ipa" \
-H "X-HockeyAppToken: $HOCKEY_TOKEN"
fi
