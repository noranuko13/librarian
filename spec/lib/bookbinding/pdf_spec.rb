# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/without_stdout'

RSpec.describe 'bookbinding:pdf', type: :task do
  include_context 'without stdout'

  context 'when valid params' do
    let(:task) { Rake.application['bookbinding:pdf'] }

    it 'Success' do
      expect { task.invoke('repository/inspect', 'tech') }.not_to raise_error
    end
  end
end
