rm -rf TestResults/YetAnotherXcframeworkTests.xcresult
rm TestResults/test_output

xcodebuild \
  -project YetAnotherXcframework.xcodeproj \
  -scheme YetAnotherXcframeworkTests \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 15,OS=17.0.1' \
  -resultBundlePath TestResults/YetAnotherXcframeworkTests.xcresult \
  test

graph_output="$(xcrun xcresulttool graph \
	--path TestResults/YetAnotherXcframeworkTests.xcresult)"

id="$(echo "${graph_output}" \
	| grep -A 2 "StandardOutputAndStandardError" \
	| grep "Id:" \
	| awk '{print $3}')"

xcrun xcresulttool export \
	--type file \
	--path TestResults/YetAnotherXcframeworkTests.xcresult \
	--output-path TestResults/test_output \
	--id ${id}
