# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/shared_arguments'
require 'support/contexts/without_stdout'

RSpec.describe Bookbinding::Process::Setup do
  subject(:run) { described_class.new(args).run }

  include_context 'without stdout'
  include_context 'shared arguments'

  let!(:filesystem_instance_double) do
    filesystem_instance_double = instance_double(Bookbinding::Filesystem)
    allow(filesystem_instance_double).to receive(:reset_dir)
    allow(Bookbinding::Filesystem).to receive(:new).and_return(filesystem_instance_double)
    filesystem_instance_double
  end

  describe '#run' do
    it 'receive reset_dir with dist' do
      run
      expect(filesystem_instance_double).to have_received(:reset_dir).once.with('dist/repository/inspect')
    end

    it 'receive reset_dir with workbench' do
      run
      expect(filesystem_instance_double).to have_received(:reset_dir).once.with('tmp/workbench/repository/inspect')
    end
  end
end
