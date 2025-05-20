# frozen_string_literal: true

RSpec.shared_context 'shared arguments' do
  let(:values) { %w[repository/inspect tech] }
  let(:missing_shelve) { [nil, 'jacket'] }
  let(:missing_jacket) { ['shelve', nil] }

  let(:args) { Rake::TaskArguments.new(Bookbinding::Arguments::NAMES, values) }

  let(:arguments) { Bookbinding::Arguments.new(args) }
end
