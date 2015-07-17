require "codeclimate-test-reporter"

CodeClimate::TestReporter.start if ENV["CODECLIMATE_REPO_TOKEN"].present?
