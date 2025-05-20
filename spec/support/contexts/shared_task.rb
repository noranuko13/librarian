# frozen_string_literal: true

RSpec.shared_context 'shared task' do
  let(:task_type) { :pdf }

  let(:rake_task) { Rake.application["bookbinding:#{task_type}"] }

  let(:task) { Bookbinding::Task.new rake_task }
end
