# frozen_string_literal: true

require 'rake_helper'
require 'support/contexts/shared_arguments'
require 'support/contexts/without_stdout'

RSpec.describe Bookbinding::Process::Collect do
  subject(:run) { described_class.new(arguments).run }

  include_context 'without stdout'
  include_context 'shared arguments'

  before do
    Bookbinding::Process::Setup.new.run
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
      tmp/workbench/lib/tasks/review.rake
      tmp/workbench/sty/gentombow.sty
      tmp/workbench/sty/jsbook.cls
      tmp/workbench/sty/jumoline.sty
      tmp/workbench/sty/plistings.sty
      tmp/workbench/sty/review-base.sty
      tmp/workbench/sty/review-custom.sty
      tmp/workbench/sty/review-jsbook.cls
      tmp/workbench/sty/review-style.sty
      tmp/workbench/sty/review-tcbox.sty
      tmp/workbench/sty/reviewmacro.sty
      tmp/workbench/Rakefile
    ], %w[
      tmp/workbench/images/cover.jpg
      tmp/workbench/images/cover-a5.ai
      tmp/workbench/sty/README.md
      tmp/workbench/.gitignore
      tmp/workbench/config.yml
      tmp/workbench/Gemfile
      tmp/workbench/style.css
    ]
    # copy_from_shelves
    # tmp/workbench/catalog.yml
  end

  describe '#copy_from_jackets' do
    it_behaves_like 'collector', %w[
      tmp/workbench/sty/review-custom.sty
    ], %w[
      tmp/workbench/config.yml
      tmp/workbench/README.md
      tmp/workbench/style.css
    ]
  end

  describe '#copy_from_shelves' do
    it_behaves_like 'collector', %w[
      tmp/workbench/images/chaps01/001.png
      tmp/workbench/plantumls/chaps01/choice.puml
      tmp/workbench/plantumls/chaps01/testdot.puml
      tmp/workbench/appendix01.re
      tmp/workbench/appendix02.re
      tmp/workbench/catalog.yml
      tmp/workbench/chaps01.re
      tmp/workbench/chaps02.re
      tmp/workbench/postdef.re
      tmp/workbench/predef.re
    ], %w[
      tmp/workbench/config.yml
      tmp/workbench/style.css
    ]
  end
end
