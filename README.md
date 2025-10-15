
# This project shows a proof of concept for a failure in `fastlane scan`.

Prerequisites for the bug:
- Have file in the project with a name that contains "Executed".
- Have compile error in the test building.

Fix: 

Example output of the non-failure:

```
bundle exec fastlane my_app_tests
[✔] 🚀 
[14:50:31]: ------------------------------
[14:50:31]: --- Step: default_platform ---
[14:50:31]: ------------------------------
[14:50:31]: Driving the lane 'ios my_app_tests' 🚀
[14:50:31]: ------------------
[14:50:31]: --- Step: scan ---
[14:50:31]: ------------------
[14:50:31]: Resolving Swift Package Manager dependencies...
[14:50:31]: $ xcodebuild -resolvePackageDependencies -scheme MyApp -project MyProject.xcodeproj
[14:50:31]: ▸ Command line invocation:
[14:50:31]: ▸     /Applications/Xcode-16.4.0-Release.Candidate.app/Contents/Developer/usr/bin/xcodebuild -resolvePackageDependencies -scheme MyApp -project MyProject.xcodeproj
[14:50:31]: ▸ 2025-10-15 14:50:31.878 xcodebuild[51509:13832494]  DVTDeviceOperation: Encountered a build number "" that is incompatible with DVTBuildVersion.
[14:50:31]: ▸ 2025-10-15 14:50:31.913 xcodebuild[51509:13832455] [MT] DVTDeviceOperation: Encountered a build number "" that is incompatible with DVTBuildVersion.
[14:50:31]: ▸ resolved source packages: 
[14:50:31]: $ xcodebuild -showBuildSettings -scheme MyApp -project MyProject.xcodeproj 2>&1
[14:50:36]: Found simulator "iPhone 11 (17.0)"

+------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                            Summary for scan 2.228.0                                                            |
+------------------------------------------------+-----------------------------------------------------------------------------------------------+
| project                                        | MyProject.xcodeproj                                                                           |
| scheme                                         | MyApp                                                                                         |
| xcodebuild_formatter                           | xcpretty                                                                                      |
| clean                                          | true                                                                                          |
| skip_build                                     | false                                                                                         |
| build_for_testing                              | true                                                                                          |
| skip_detect_devices                            | false                                                                                         |
| ensure_devices_found                           | false                                                                                         |
| force_quit_simulator                           | false                                                                                         |
| reset_simulator                                | false                                                                                         |
| disable_slide_to_type                          | true                                                                                          |
| reinstall_app                                  | false                                                                                         |
| open_report                                    | false                                                                                         |
| output_directory                               | ./fastlane/test_output                                                                        |
| output_types                                   | html,junit                                                                                    |
| buildlog_path                                  | ~/Library/Logs/scan                                                                           |
| include_simulator_logs                         | false                                                                                         |
| output_remove_retry_attempts                   | false                                                                                         |
| derived_data_path                              | /Users/alvarhansen/Library/Developer/Xcode/DerivedData/MyProject-gwheajjmccymjgenzixhnussaxko |
| should_zip_build_products                      | false                                                                                         |
| output_xctestrun                               | false                                                                                         |
| result_bundle                                  | false                                                                                         |
| use_clang_report_name                          | false                                                                                         |
| disable_concurrent_testing                     | false                                                                                         |
| slack_use_webhook_configured_username_and_icon | false                                                                                         |
| slack_username                                 | fastlane                                                                                      |
| slack_icon_url                                 | https://fastlane.tools/assets/img/fastlane_icon.png                                           |
| skip_slack                                     | false                                                                                         |
| slack_only_on_failure                          | false                                                                                         |
| run_rosetta_simulator                          | false                                                                                         |
| xcodebuild_command                             | env NSUnbufferedIO=YES xcodebuild                                                             |
| skip_package_dependencies_resolution           | false                                                                                         |
| disable_package_automatic_updates              | false                                                                                         |
| use_system_scm                                 | false                                                                                         |
| number_of_retries                              | 0                                                                                             |
| fail_build                                     | true                                                                                          |
| xcode_path                                     | /Applications/Xcode-16.4.0-Release.Candidate.app                                              |
+------------------------------------------------+-----------------------------------------------------------------------------------------------+

[14:50:37]: Disabling 'Slide to Type' iPhone 11
[14:50:37]: $ /usr/libexec/PlistBuddy -c "Add :KeyboardContinuousPathEnabled bool false" /Users/alvarhansen/Library/Developer/CoreSimulator/Devices/7C594C53-2E1E-4F69-B388-0E600CF419E6/data/Library/Preferences/com.apple.keyboard.ContinuousPath.plist >/dev/null 2>&1
[14:50:37]: $ set -o pipefail && env NSUnbufferedIO=YES xcodebuild -scheme MyApp -project MyProject.xcodeproj -derivedDataPath /Users/alvarhansen/Library/Developer/Xcode/DerivedData/MyProject-gwheajjmccymjgenzixhnussaxko -destination 'platform=iOS Simulator,id=7C594C53-2E1E-4F69-B388-0E600CF419E6' clean build-for-testing | tee '/Users/alvarhansen/Library/Logs/scan/MyApp-MyApp.log' | xcpretty  --report html --output '/Users/alvarhansen/Developer/fastlane-scan-failure-poc/fastlane/test_output/report.html' --report junit --output '/Users/alvarhansen/Developer/fastlane-scan-failure-poc/fastlane/test_output/report.junit' --report junit --output '/var/folders/l4/mhcpfvkn42vgtzd2rq9sw7zh0000gn/T/junit_report20251015-51481-yw6236' 
[14:50:37]: ▸ Loading...
[14:50:37]: ▸ 2025-10-15 14:50:37.811 xcodebuild[51558:13833109]  DVTDeviceOperation: Encountered a build number "" that is incompatible with DVTBuildVersion.
[14:50:37]: ▸ 2025-10-15 14:50:37.844 xcodebuild[51558:13832934] [MT] DVTDeviceOperation: Encountered a build number "" that is incompatible with DVTBuildVersion.
[14:50:37]: ▸ --- xcodebuild: WARNING: Using the first of multiple matching destinations:
[14:50:37]: ▸ { platform:iOS Simulator, arch:arm64, id:7C594C53-2E1E-4F69-B388-0E600CF419E6, OS:17.0.1, name:iPhone 11 }
[14:50:37]: ▸ { platform:iOS Simulator, arch:x86_64, id:7C594C53-2E1E-4F69-B388-0E600CF419E6, OS:17.0.1, name:iPhone 11 }
[14:50:38]: ▸ Clean Succeeded
[14:50:38]: ▸ --- xcodebuild: WARNING: Using the first of multiple matching destinations:
[14:50:38]: ▸ { platform:iOS Simulator, arch:arm64, id:7C594C53-2E1E-4F69-B388-0E600CF419E6, OS:17.0.1, name:iPhone 11 }
[14:50:38]: ▸ { platform:iOS Simulator, arch:x86_64, id:7C594C53-2E1E-4F69-B388-0E600CF419E6, OS:17.0.1, name:iPhone 11 }
[14:50:38]: ▸ Processing Info.plist
[14:50:38]: ▸ Linking __preview.dylib
[14:50:39]: ▸ ** TEST BUILD FAILED **
[14:50:39]: ▸ The following build commands failed:
[14:50:39]: ▸ 	SwiftCompile normal arm64 Compiling\ MyAppTestsFileThatContainsWordExecuted.swift /Users/alvarhansen/Developer/fastlane-scan-failure-poc/MyAppTests/MyAppTestsFileThatContainsWordExecuted.swift (in target 'MyAppTests' from project 'MyProject')
[14:50:39]: ▸ 	SwiftCompile normal arm64 /Users/alvarhansen/Developer/fastlane-scan-failure-poc/MyAppTests/MyAppTestsFileThatContainsWordExecuted.swift (in target 'MyAppTests' from project 'MyProject')
[14:50:39]: ▸ 	Building project MyProject for testing with scheme MyApp
[14:50:39]: ▸ (3 failures)
[14:50:39]: ▸ ❌  /Users/alvarhansen/Developer/fastlane-scan-failure-poc/MyAppTests/MyAppTestsFileThatContainsWordExecuted.swift:8:16: build error
[14:50:39]: ▸         #error("build error")
[14:50:39]: ▸                ^~~~~~~~~~~~~
[14:50:39]: ▸ Linking MyApp.debug.dylib
[14:50:39]: Exit status: 65

+---------------------------------------+
|           fastlane summary            |
+------+------------------+-------------+
| Step | Action           | Time (in s) |
+------+------------------+-------------+
| 1    | default_platform | 0           |
| 2    | scan             | 8           |
+------+------------------+-------------+

[14:50:39]: fastlane.tools finished successfully 🎉
```
