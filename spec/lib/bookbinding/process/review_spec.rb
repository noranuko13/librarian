# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/shared_arguments'
require 'support/contexts/without_stdout'

RSpec.describe Bookbinding::Process::Review do
  subject(:run) { described_class.new(arguments).run }

  include_context 'without stdout'
  include_context 'shared arguments'

  before do
    Bookbinding::Process::Setup.new(arguments).run
    Bookbinding::Process::Collect.new(arguments).run
    Bookbinding::Process::Merge.new(arguments).run
  end

  describe '#run' do
    context 'when failure' do
      it 'raise ReviewError' do
        FileUtils.rm_rf 'tmp/workbench/repository/inspect/config.yml'
        expect { run }.to raise_error Bookbinding::Process::Review::ReviewError,
                                      'Re:VIEWの実行に失敗しました'
      end
    end
  end

  describe '#review_rake' do
    context 'when pdf' do
      it 'pdf created' do
        f = 'tmp/workbench/repository/inspect/inspect.pdf'
        expect { run }.to change { File.exist?(f) }.from(false).to(true)
      end
    end
  end
end
