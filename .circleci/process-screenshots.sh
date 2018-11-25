export REPORT_ARTEFACT_URL=https://circleci.com/api/v1.1/project/github/${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}/${CIRCLE_BUILD_NUM}/artifacts/0/root/app

# Travese the screenshots folder and pull out all screenshots
# format the files so they can be injected into a slack message
# as a link. Replace http:// with variable for artifact path
for f in cypress/screenshots/{,**/,**/**/,**/**/**/}*.png; do

  # ignore empty dirs that we globbed that have * in the path
    regex='\*'
    if [[ ! $f =~ $regex ]]
    then
        trimmed_filename=$(echo $f | sed 's#.*/##' )       
        attachment_ahrefs="<http://$REPORT_ARTEFACT_URL$trimmed_filename|Video:- $trimmed_filename>\n$attachment_ahrefs"
    fi
  done

# Post the list of screenshots links to slack
curl -X POST -H 'Content-type: application/json' \
--data '{"text": "'"$attachment_ahrefs"'" }' \
$SLACK_WEBHOOK_URL