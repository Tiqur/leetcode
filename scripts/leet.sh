#!/bin/sh

# Fetch CSRF token
#CSRF=$(curl --silent --output /dev/null -c - 'https://leetcode.com/' | tail -c 65)
#echo $CSRF

# Fetch problem and extract data
PROBLEM_DATA=$(curl 'https://leetcode.com/graphql' \
  -H 'content-type: application/json' \
  --data-raw "{\"operationName\":\"questionData\",\"variables\":{\"titleSlug\":\"$1\"},\"query\":\"query questionData(\$titleSlug: String!) {\n  question(titleSlug: \$titleSlug) {\n    questionId\n    questionFrontendId\n    boundTopicId\n    title\n    titleSlug\n    content\n    translatedTitle\n    translatedContent\n    isPaidOnly\n    difficulty\n    likes\n    dislikes\n    isLiked\n    similarQuestions\n    exampleTestcases\n    contributors {\n      username\n      profileUrl\n      avatarUrl\n      __typename\n    }\n    topicTags {\n      name\n      slug\n      translatedName\n      __typename\n    }\n    companyTagStats\n    codeSnippets {\n      lang\n      langSlug\n      code\n      __typename\n    }\n    stats\n    hints\n    solution {\n      id\n      canSeeDetail\n      paidOnly\n      hasVideoSolution\n      paidOnlyVideo\n      __typename\n    }\n    status\n    sampleTestCase\n    metaData\n    judgerAvailable\n    judgeType\n    mysqlSchemas\n    enableRunCode\n    enableTestMode\n    enableDebugger\n    envInfo\n    libraryUrl\n    adminUrl\n    __typename\n  }\n}\n\"}" | \
  python3 -c "import sys, json; print(json.load(sys.stdin)['data'])")
echo $PROBLEM_DATA

