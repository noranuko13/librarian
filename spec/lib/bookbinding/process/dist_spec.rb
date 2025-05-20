# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/without_stdout'
require 'support/contexts/shared_task'
require 'support/contexts/shared_arguments'

RSpec.describe Bookbinding::Process::Dist do
  subject(:run) { described_class.new(arguments).run }

  include_context 'without stdout'
  include_context 'shared task'
  include_context 'shared arguments'

  before do
    Bookbinding::Process::Setup.new(arguments).run
    Bookbinding::Process::Collect.new(arguments).run
    Bookbinding::Process::Merge.new(arguments).run
    Bookbinding::Process::Review.new(task, arguments).run
  end

  describe '#run' do
    context 'when pdf' do
      let(:task_type) { Bookbinding::Task::TYPE_PDF }

      it 'pdf copied' do
        f = 'dist/repository/inspect/inspect.pdf'
        expect { run }.to change { File.exist?(f) }.from(false).to(true)
      end
    end

    context 'when text' do
      let(:task_type) { Bookbinding::Task::TYPE_TEXT }

      let(:files) do
        %w[
          dist/repository/inspect/inspect-text/appendix01.txt
          dist/repository/inspect/inspect-text/appendix02.txt
          dist/repository/inspect/inspect-text/chaps01.txt
          dist/repository/inspect/inspect-text/chaps02.txt
          dist/repository/inspect/inspect-text/postdef.txt
          dist/repository/inspect/inspect-text/predef.txt
        ]
      end

      it 'text copied' do
        expect { run }.to change { files.all? { |f| File.exist?(f) } }.from(false).to(true)
      end
    end
  end
end
