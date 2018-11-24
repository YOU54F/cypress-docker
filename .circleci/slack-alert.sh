# if [ "${CIRCLE_BRANCH}" == "circleci" ]; then
# two reports here, access it with .json or .html
export REPORT_LOCATION=~/app/cypress/reports/mocha/mochawesome    
totalTestsPassing=$(jq '.stats.passes' ${REPORT_LOCATION}.json )
totalTestsFailing=$(jq '.stats.failures' ${REPORT_LOCATION}.json )
totalTests=$(jq '.stats.tests' ${REPORT_LOCATION}.json )
testDuration=$(jq '.stats.duration' ${REPORT_LOCATION}.json )
export TOTAL_TESTS=$totalTests
export TOTAL_TESTS_FAILING=$totalTestsFailing 
export TOTAL_TESTS_PASSING=$totalTestsPassing 
export TEST_DURATION=$testDuration 
export VIDEO_LOCATION=~/app/cypress/videos/examples/theinternet.spec.js.mp4 
export REPORT_ARTEFACT_URL=https://circleci.com/api/v1.1/project/github/${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}/${CIRCLE_BUILD_NUM}/artifacts/0/
export REPORT_ARTEFACT_LOCATION=${REPORT_ARTEFACT_URL}${REPORT_LOCATION}.html
export VIDEO_ARTEFACT_LOCATION=${REPORT_ARTEFACT_URL}${VIDEO_LOCATION}

# if total tests failing is more than 0, publish failure to slack
      if [ $TOTAL_TESTS_FAILING -gt 0 ]; then
            curl -X POST -H 'Content-type: application/json' \
            --data '{"text":"'${CIRCLE_PROJECT_REPONAME}' test run failed.\nThis run was triggered by '${CIRCLE_USERNAME}'","channel":"'$SLACK_API_CHANNEL'",
            "attachments":[{"color":"#ff0000","fallback":"Report available at '$REPORT_ARTEFACT_LOCATION'",
            "title":"Total Failed: '$TOTAL_TESTS_FAILING'",
            "text":"Environment: '${CIRCLE_BRANCH}'\nTotal Tests: '$TOTAL_TESTS'\nTotal Passing: '$TOTAL_TESTS_PASSING'",
            "footer":"Test Duration: '$TEST_DURATION'ms",
            "actions":[{"type":"button","text":"Test Report","url":"'$REPORT_ARTEFACT_LOCATION'","style":"primary"},
            {"type":"button","text":"Test Video","url":"'$VIDEO_ARTEFACT_LOCATION'","style":"primary"},
            {"type":"button","text":"CircleCI Logs","url":"'${CIRCLE_BUILD_URL}'","style":"primary"}]}]}' \
            $SLACK_WEBHOOK_URL 
# else if total tests failing is equal to 0, publish success to slack
      elif [ $TOTAL_TESTS_FAILING -eq 0 ]; then
            curl -X POST -H 'Content-type: application/json' \
            --data '{"text":"'${CIRCLE_PROJECT_REPONAME}' test run passed.\nThis run was triggered by '${CIRCLE_USERNAME}'","channel":"'$SLACK_API_CHANNEL'",
            "attachments":[{"color":"#36a64f","fallback":"Report available at '$REPORT_ARTEFACT_LOCATION'",
            "text":"Environment: '${CIRCLE_BRANCH}'\nTotal Passed: '$TOTAL_TESTS_PASSING'",
            "footer":"Test Duration: '$TEST_DURATION'ms",
            "actions":[{"type":"button","text":"Test Report","url":"'$REPORT_ARTEFACT_LOCATION'","style":"primary"},
            {"type":"button","text":"Test Video","url":"'$VIDEO_ARTEFACT_LOCATION'","style":"primary"},
            {"type":"button","text":"CircleCI Logs","url":"'${CIRCLE_BUILD_URL}'","style":"primary"}]}]}' \
            $SLACK_WEBHOOK_URL     
      # closing if from slack reporting conditions    
      fi 

# closing if from branch condition at top of script    
# fi

      
     
