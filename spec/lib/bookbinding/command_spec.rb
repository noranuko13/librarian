# frozen_string_literal: true

require 'rake_helper'

RSpec.describe Bookbinding::Command do
  before do
    allow($stdout).to receive(:write)
  end

  let(:args) do
    Rake::TaskArguments.new(Bookbinding::Arguments::NAMES, %w[repository/inspect tech])
  end

  describe '#execute' do
    subject(:execute) { described_class.new(args).execute }

    context 'when [repository/inspect,tech]' do
      it 'Success' do
        expect { execute }.not_to raise_error
      end
    end
  end
end
