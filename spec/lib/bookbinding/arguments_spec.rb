# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/shared_arguments'
require 'support/contexts/without_stdout'

RSpec.describe Bookbinding::Arguments do
  include_context 'without stdout'
  include_context 'shared arguments'

  describe '#initialize' do
    subject(:init) { described_class.new(args) }

    it 'Success' do
      expect { init }.not_to raise_error
    end

    shared_examples 'invalid arguments' do
      it 'raise ArgumentsError' do
        expect { init }.to raise_error Bookbinding::Arguments::ArgumentsError
      end
    end

    context 'without shelve' do
      let(:values) { missing_shelve }

      it_behaves_like 'invalid arguments'
    end

    context 'without jacket' do
      let(:values) { missing_jacket }

      it_behaves_like 'invalid arguments'
    end
  end

  describe '#dist_dir' do
    subject(:dist_dir) { described_class.new(args).dist_dir }

    it 'get dist directory' do
      expect(dist_dir).to eq 'dist/repository/inspect'
    end
  end

  describe '#shelves_dir' do
    subject(:shelves_dir) { described_class.new(args).shelves_dir }

    it 'get shelves directory' do
      expect(shelves_dir).to eq 'shelves/repository/inspect'
    end
  end

  describe '#jackets_dir' do
    subject(:jackets_dir) { described_class.new(args).jackets_dir }

    it 'get jackets directory' do
      expect(jackets_dir).to eq 'jackets/tech'
    end
  end

  describe '#workbench_dir' do
    subject(:workbench_dir) { described_class.new(args).workbench_dir }

    it 'get workbench directory' do
      expect(workbench_dir).to eq 'tmp/workbench/repository/inspect'
    end
  end
end
