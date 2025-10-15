

fastlane: setup project
	bundle exec fastlane my_app_tests

setup:
	bundle install --path vendor/bundle

project:
	xcodegen generate --spec project.yml