# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/shared_arguments'
require 'support/contexts/without_stdout'

RSpec.describe Bookbinding::Process::Dist do
  subject(:run) { described_class.new(arguments).run }

  include_context 'without stdout'
  include_context 'shared arguments'

  before do
    Bookbinding::Process::Setup.new(arguments).run
    Bookbinding::Process::Collect.new(arguments).run
    Bookbinding::Process::Merge.new(arguments).run
    Bookbinding::Process::Review.new(arguments).run
  end

  describe '#run' do
    context 'when pdf' do
      it 'pdf copied' do
        f = 'dist/repository/inspect/inspect.pdf'
        expect { run }.to change { File.exist?(f) }.from(false).to(true)
      end
    end
  end
end
