# frozen_string_literal: true

require 'rake_helper'

RSpec.describe Bookbinding::Termout do
  let(:termout) { described_class.new }

  describe '#debug' do
    context 'with body' do
      it 'output formatted string to standard output' do
        expected = "\e[35m[debug] subject\e[0m body\n"
        expect { termout.debug('subject', 'body') }.to output(expected).to_stdout
      end
    end

    context 'without body' do
      it 'output formatted string to standard output' do
        expected = "\e[35m[debug] subject\e[0m\n"
        expect { termout.debug('subject') }.to output(expected).to_stdout
      end
    end
  end

  describe '#info' do
    context 'with body' do
      it 'output formatted string to standard output' do
        expected = "\e[34m[info] subject\e[0m body\n"
        expect { termout.info('subject', 'body') }.to output(expected).to_stdout
      end
    end

    context 'without body' do
      it 'output formatted string to standard output' do
        expected = "\e[34m[info] subject\e[0m\n"
        expect { termout.info('subject') }.to output(expected).to_stdout
      end
    end
  end

  describe '#success' do
    context 'with body' do
      it 'output formatted string to standard output' do
        expected = "\e[32m[success] subject\e[0m body\n"
        expect { termout.success('subject', 'body') }.to output(expected).to_stdout
      end
    end

    context 'without body' do
      it 'output formatted string to standard output' do
        expected = "\e[32m[success] subject\e[0m\n"
        expect { termout.success('subject') }.to output(expected).to_stdout
      end
    end
  end

  describe '#warning' do
    context 'with body' do
      it 'output formatted string to standard output' do
        expected = "\e[33m[warning] subject\e[0m body\n"
        expect { termout.warning('subject', 'body') }.to output(expected).to_stdout
      end
    end

    context 'without body' do
      it 'output formatted string to standard output' do
        expected = "\e[33m[warning] subject\e[0m\n"
        expect { termout.warning('subject') }.to output(expected).to_stdout
      end
    end
  end

  describe '#error' do
    context 'with body' do
      it 'output formatted string to standard output' do
        expected = "\e[31m[error] subject\e[0m body\n"
        expect { termout.error('subject', 'body') }.to output(expected).to_stdout
      end
    end

    context 'without body' do
      it 'output formatted string to standard output' do
        expected = "\e[31m[error] subject\e[0m\n"
        expect { termout.error('subject') }.to output(expected).to_stdout
      end
    end
  end
end
