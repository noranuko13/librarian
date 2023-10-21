# frozen_string_literal: true

require 'rake_helper'

RSpec.describe 'bookbinding:pdf', type: :task do
  before do
    allow($stdout).to receive(:write)
  end

  context 'when valid params' do
    let(:task) { Rake.application['bookbinding:pdf'] }

    it 'Success' do
      expect { task.invoke('repository/inspect', 'tech') }.not_to raise_error
    end
  end
end
