# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/without_stdout'
require 'support/contexts/shared_task'

RSpec.describe 'bookbinding:text', type: :task do
  include_context 'without stdout'
  include_context 'shared task'

  context 'when valid params' do
    let(:task_type) { :text }

    it 'Success' do
      expect { rake_task.invoke('repository/inspect', 'tech') }.not_to raise_error
    end
  end
end
