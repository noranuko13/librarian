# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/shared_arguments'
require 'support/contexts/without_stdout'

RSpec.describe Bookbinding::Process::Merge do
  subject(:run) { described_class.new(args).run }

  include_context 'without stdout'
  include_context 'shared arguments'

  before do
    Bookbinding::Process::Setup.new(args).run
    Bookbinding::Process::Collect.new(args).run
  end

  describe '#merge_config' do
    it 'merged config.yml' do
      run
      config = YAML.load_file('tmp/workbench/repository/inspect/config.yml')
      expect(config['review_version']).to eq 5.0
      expect(config['bookname']).to eq 'inspect'
    end
  end

  describe '#merge_style' do
    it 'merged style.css' do
      run
      css = File.read('tmp/workbench/repository/inspect/style.css')
      expect(css).to include '/*! [jackets/tech] */'
      expect(css).to include '/*! [shelves/repository/inspect] */'
    end
  end
end
