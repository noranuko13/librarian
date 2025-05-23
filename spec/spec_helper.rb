# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  load_profile 'test_frameworks'
  track_files 'lib/**/*.rb'
end

require 'bookbinding'

## https://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  # Output
  config.color_mode = :on
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.profile_examples = 1
  config.warnings = true
  # Execute
  config.disable_monkey_patching!
  config.filter_run_when_matching :focus
  config.order = :random
  Kernel.srand config.seed
  # RSpec4
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
