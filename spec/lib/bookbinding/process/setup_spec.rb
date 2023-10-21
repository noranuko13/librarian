# frozen_string_literal: true

require 'rake_helper'

RSpec.describe Bookbinding::Process::Setup do
  subject(:run) { described_class.new.run }

  before do
    allow($stdout).to receive(:write)
  end

  let!(:filesystem_instance_double) do
    filesystem_instance_double = instance_double(Bookbinding::Filesystem)
    allow(filesystem_instance_double).to receive(:reset_dir)
    allow(Bookbinding::Filesystem).to receive(:new).and_return(filesystem_instance_double)
    filesystem_instance_double
  end

  describe '#run' do
    it 'receive reset_dir with dist' do
      run
      expect(filesystem_instance_double).to have_received(:reset_dir).once.with('dist')
    end

    it 'receive reset_dir with workbench' do
      run
      expect(filesystem_instance_double).to have_received(:reset_dir).once.with('tmp/workbench')
    end
  end
end
