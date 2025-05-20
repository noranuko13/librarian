# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/shared_arguments'
require 'support/contexts/without_stdout'

RSpec.describe Bookbinding::Verify::ArgumentsContract do
  let(:contract) { described_class.new }

  include_context 'without stdout'

  describe '#initialize' do
    it 'Success' do
      expect { contract }.not_to raise_error
    end
  end

  describe '#call' do
    subject(:result) { contract.call(args.to_h) }

    include_context 'shared arguments'

    it 'Success' do
      expect(result.errors).to be_empty
    end

    context 'without shelve' do
      let(:values) { missing_shelve }

      it 'is missing' do
        expect(result.errors[:shelve]).to eq ['is missing']
      end
    end

    context 'without jacket' do
      let(:values) { missing_jacket }

      it 'is missing' do
        expect(result.errors[:jacket]).to eq ['is missing']
      end
    end
  end
end
