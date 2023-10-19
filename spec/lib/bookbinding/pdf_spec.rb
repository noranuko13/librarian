# frozen_string_literal: true

require 'rake_helper'

RSpec.describe 'bookbinding:pdf', type: :task do
  context 'when valid params' do
    let(:task) { Rake.application['bookbinding:pdf'] }

    it 'Success' do
      expect { task.invoke }.not_to raise_error
    end
  end
end
