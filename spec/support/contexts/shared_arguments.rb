# frozen_string_literal: true

RSpec.shared_context 'shared arguments' do
  let(:values) { %w[repository/inspect tech] }
  let(:missing_shelve) { [nil, 'jacket'] }
  let(:missing_jacket) { ['shelve', nil] }

  let(:rake_args) { Rake::TaskArguments.new(Bookbinding::Arguments::NAMES, values) }

  let(:args) { Bookbinding::Arguments.new(rake_args) }
end
