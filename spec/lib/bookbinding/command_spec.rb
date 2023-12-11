# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/shared_arguments'

RSpec.describe Bookbinding::Command do
  before do
    allow($stdout).to receive(:write)
  end

  include_context 'shared arguments'

  describe '#execute' do
    subject(:execute) { described_class.new(args).execute }

    context 'when [repository/inspect,tech]' do
      it 'Success' do
        expect { execute }.not_to raise_error
      end
    end
  end
end
