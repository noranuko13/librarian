# frozen_string_literal: true

require 'rake_helper'

RSpec.describe Bookbinding::Process::Dist do
  subject(:run) { described_class.new(arguments).run }

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
    Bookbinding::Process::Review.new.run
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
