# frozen_string_literal: true

require 'rake_helper'

RSpec.describe Bookbinding::Process::Review do
  subject(:run) { described_class.new.run }

  let(:values) { %w[repository/inspect tech] }

  let(:arguments) do
    args = Rake::TaskArguments.new(Bookbinding::Arguments::NAMES, values)
    Bookbinding::Arguments.new(args)
  end

  before do
    allow($stdout).to receive(:write)
    Bookbinding::Process::Setup.new.run
    Bookbinding::Process::Collect.new(arguments).run
    Bookbinding::Process::Merge.new(arguments).run
  end

  describe '#run' do
    context 'when failure' do
      it 'raise ReviewError' do
        FileUtils.rm_rf 'tmp/workbench/config.yml'
        expect { run }.to raise_error Bookbinding::Process::Review::ReviewError,
                                      'Re:VIEWの実行に失敗しました'
      end
    end
  end

  describe '#review_rake' do
    context 'when pdf' do
      it 'pdf created' do
        f = 'tmp/workbench/inspect.pdf'
        expect { run }.to change { File.exist?(f) }.from(false).to(true)
      end
    end
  end
end
