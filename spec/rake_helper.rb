# frozen_string_literal: true

require 'rake'
require 'spec_helper'

RSpec.configure do |config|
  config.before(:suite) do
    load 'Rakefile'
  end
  config.before do
    Rake.application.tasks.each(&:reenable)
  end
end
