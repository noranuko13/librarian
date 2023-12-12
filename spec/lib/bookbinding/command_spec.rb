# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/shared_arguments'
require 'support/contexts/without_stdout'

RSpec.describe Bookbinding::Command do
  include_context 'without stdout'
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
