# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/shared_arguments'
require 'support/contexts/without_stdout'

RSpec.describe Bookbinding::Process::Collect do
  subject(:run) { described_class.new(arguments).run }

  include_context 'without stdout'
  include_context 'shared arguments'

  before do
    Bookbinding::Process::Setup.new(arguments).run
  end

  shared_examples 'collector' do |copied_files, ignored_files|
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
    it_behaves_like 'collector', %w[
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
    ], %w[
      tmp/workbench/repository/inspect/images/cover.jpg
      tmp/workbench/repository/inspect/images/cover-a5.ai
      tmp/workbench/repository/inspect/sty/README.md
      tmp/workbench/repository/inspect/.gitignore
      tmp/workbench/repository/inspect/config.yml
      tmp/workbench/repository/inspect/Gemfile
      tmp/workbench/repository/inspect/style.css
    ]
    # copy_from_shelves
    # tmp/workbench/repository/inspect/catalog.yml
  end

  describe '#copy_from_jackets' do
    it_behaves_like 'collector', %w[
      tmp/workbench/repository/inspect/sty/review-custom.sty
    ], %w[
      tmp/workbench/repository/inspect/config.yml
      tmp/workbench/repository/inspect/README.md
      tmp/workbench/repository/inspect/style.css
    ]
  end

  describe '#copy_from_shelves' do
    it_behaves_like 'collector', %w[
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
    ], %w[
      tmp/workbench/repository/inspect/config.yml
      tmp/workbench/repository/inspect/style.css
    ]
  end
end
