# frozen_string_literal: true

require 'rake_helper'

RSpec.describe Bookbinding::Task do
  describe '#initialize' do
    subject(:init) { described_class.new(task) }

    let(:task) { Rake.application['bookbinding:pdf'] }

    it 'Success' do
      expect { init }.not_to raise_error
    end
  end

  describe '#type' do
    subject(:type) { described_class.new(task).type }

    let(:task) { Rake.application["bookbinding:#{task_type}"] }

    describe 'pdf' do
      let(:task_type) { :pdf }

      it 'get type :pdf' do
        expect(type).to eq task_type
      end
    end

    describe 'text' do
      let(:task_type) { :text }

      it 'get type :text' do
        expect(type).to eq task_type
      end
    end
  end
end
