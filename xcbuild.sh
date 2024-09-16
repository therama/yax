xcodebuild archive \
    -project YetAnotherXcframework.xcodeproj \
    -scheme YetAnotherXcframework \
    -destination "generic/platform=iOS Simulator" \
    -archivePath "Archives/YetAnotherXcframework/simulator"

xcodebuild archive \
    -project YetAnotherXcframework.xcodeproj \
    -scheme YetAnotherXcframework \
    -destination "generic/platform=iOS" \
    -archivePath "Archives/YetAnotherXcframework/device"

v="$(cat YetAnotherXcframework.xcodeproj/project.pbxproj \
    | grep -m1 'MARKETING_VERSION' \
    | cut -d'=' -f2 \
    | tr -d ';' \
    | tr -d ' ')"

rm -rf Builds/${v}/YetAnotherXcframework.xcframework

xcodebuild -create-xcframework \
    -archive Archives/YetAnotherXcframework/simulator.xcarchive -framework YetAnotherXcframework.framework \
    -archive Archives/YetAnotherXcframework/device.xcarchive -framework YetAnotherXcframework.framework \
    -output Builds/${v}/YetAnotherXcframework.xcframework

rm -rf Archives