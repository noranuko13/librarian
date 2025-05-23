# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/shared_arguments'
require 'support/contexts/without_stdout'

RSpec.describe Bookbinding::Process::Collect do
  subject(:run) { described_class.new(args).run }

  include_context 'without stdout'
  include_context 'shared arguments'

  before do
    Bookbinding::Process::Setup.new(args).run
  end

  shared_examples 'collector' do
    it 'files have been copied' do
      expect(copied_files.none? { |f| File.exist?(f) }).to be true
      run
      expect(copied_files.all? { |f| File.exist?(f) }).to be true
    end

    it "files don't exist" do
      run
      expect(ignored_files.none? { |f| File.exist?(f) }).to be true
    end
  end

  describe '#copy_from_upgrade' do
    let(:copied_files) do
      %w[
        tmp/workbench/repository/inspect/lib/tasks/review.rake
        tmp/workbench/repository/inspect/sty/gentombow.sty
        tmp/workbench/repository/inspect/sty/jsbook.cls
        tmp/workbench/repository/inspect/sty/jumoline.sty
        tmp/workbench/repository/inspect/sty/plistings.sty
        tmp/workbench/repository/inspect/sty/review-base.sty
        tmp/workbench/repository/inspect/sty/review-custom.sty
        tmp/workbench/repository/inspect/sty/review-jsbook.cls
        tmp/workbench/repository/inspect/sty/review-style.sty
        tmp/workbench/repository/inspect/sty/review-tcbox.sty
        tmp/workbench/repository/inspect/sty/reviewmacro.sty
        tmp/workbench/repository/inspect/Rakefile
      ]
    end
    let(:ignored_files) do
      %w[
        tmp/workbench/repository/inspect/images/cover.jpg
        tmp/workbench/repository/inspect/images/cover-a5.ai
        tmp/workbench/repository/inspect/sty/README.md
        tmp/workbench/repository/inspect/.gitignore
        tmp/workbench/repository/inspect/config.yml
        tmp/workbench/repository/inspect/Gemfile
        tmp/workbench/repository/inspect/style.css
      ]
    end
    # copy_from_shelves
    # tmp/workbench/repository/inspect/catalog.yml

    it_behaves_like 'collector'
  end

  describe '#copy_from_jackets' do
    let(:copied_files) do
      %w[
        tmp/workbench/repository/inspect/sty/review-custom.sty
      ]
    end
    let(:ignored_files) do
      %w[
        tmp/workbench/repository/inspect/config.yml
        tmp/workbench/repository/inspect/README.md
        tmp/workbench/repository/inspect/style.css
      ]
    end

    it_behaves_like 'collector'
  end

  describe '#copy_from_shelves' do
    let(:copied_files) do
      %w[
        tmp/workbench/repository/inspect/images/chaps01/001.png
        tmp/workbench/repository/inspect/plantumls/chaps01/choice.puml
        tmp/workbench/repository/inspect/plantumls/chaps01/testdot.puml
        tmp/workbench/repository/inspect/appendix01.re
        tmp/workbench/repository/inspect/appendix02.re
        tmp/workbench/repository/inspect/catalog.yml
        tmp/workbench/repository/inspect/chaps01.re
        tmp/workbench/repository/inspect/chaps02.re
        tmp/workbench/repository/inspect/postdef.re
        tmp/workbench/repository/inspect/predef.re
      ]
    end
    let(:ignored_files) do
      %w[
        tmp/workbench/repository/inspect/config.yml
        tmp/workbench/repository/inspect/style.css
      ]
    end

    it_behaves_like 'collector'
  end
end
