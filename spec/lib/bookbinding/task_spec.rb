# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/shared_task'

RSpec.describe Bookbinding::Task do
  include_context 'shared task'

  describe '#initialize' do
    subject(:init) { described_class.new rake_task }

    it 'Success' do
      expect { init }.not_to raise_error
    end
  end

  describe '#type' do
    subject(:type) { described_class.new(rake_task).type }

    describe 'pdf' do
      let(:task_type) { Bookbinding::Task::TYPE_PDF }

      it 'get type :pdf' do
        expect(type).to eq task_type
      end
    end

    describe 'text' do
      let(:task_type) { Bookbinding::Task::TYPE_TEXT }

      it 'get type :text' do
        expect(type).to eq task_type
      end
    end
  end
end
