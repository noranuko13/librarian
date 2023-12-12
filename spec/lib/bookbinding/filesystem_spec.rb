# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/without_stdout'

RSpec.describe Bookbinding::Filesystem do
  let!(:test_dir) { 'tmp/rspec' }

  include_context 'without stdout'

  before do
    FileUtils.rm_rf(test_dir)
  end

  after do
    FileUtils.rm_rf(test_dir)
  end

  describe '#reset_dir' do
    subject(:reset_dir) { described_class.new.reset_dir(test_dir) }

    context 'when the directory does not exist' do
      it 'create the directory' do
        expect { reset_dir }.to change { Dir.exist?(test_dir) }.from(false).to(true)
      end
    end

    context 'when some files already exists' do
      let!(:test_file) { File.join(test_dir, 'touch.txt') }

      before do
        FileUtils.mkdir_p(test_dir)
        FileUtils.touch(test_file)
      end

      it 'recreate the directory' do
        expect { reset_dir }.to change { File.exist?(test_file) }.from(true).to(false)
      end
    end

    context 'when error occurs' do
      before do
        allow(FileUtils).to receive(:mkdir_p).and_raise(Errno::EACCES)
      end

      it 'raise FilesystemError' do
        expect { reset_dir }.to raise_error(Bookbinding::Filesystem::FilesystemError)
      end
    end
  end

  describe '#copy' do
    subject(:copy) { described_class.new.copy(src_file, dist_file) }

    let!(:src_file) { File.join(test_dir, 'touch.txt') }
    let!(:dist_dir) { File.join(test_dir, 'dist') }
    let!(:dist_file) { File.join(dist_dir, 'touch.txt') }

    context 'when src file exist' do
      before do
        FileUtils.mkdir_p(test_dir)
        FileUtils.touch(src_file)
      end

      it 'copy src file' do
        expect { copy }.to change { File.exist?(dist_file) }.from(false).to(true)
      end
    end

    context 'when dist file exist' do
      before do
        FileUtils.mkdir_p(test_dir)
        FileUtils.mkdir_p(dist_dir)
        File.write(src_file, 'src')
        File.write(dist_file, 'dist')
      end

      it 'overwrite src file' do
        expect { copy }.to change { File.read(dist_file) }.from('dist').to('src')
      end
    end

    context 'when src file does not exist' do
      it 'raise FilesystemError' do
        expect { copy }.to raise_error(Bookbinding::Filesystem::FilesystemError)
      end
    end
  end

  describe '#pwd' do
    context 'when src file exist' do
      before do
        Dir.chdir('/tmp')
      end

      after do
        Dir.chdir('/librarian')
      end

      it 'move directory' do
        described_class.new.pwd('/home') do
          expect(Dir.pwd).to eq '/home'
        end
        expect(Dir.pwd).to eq '/tmp'
      end
    end
  end
end
