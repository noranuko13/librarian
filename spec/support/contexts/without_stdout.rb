# frozen_string_literal: true

RSpec.shared_context 'without stdout' do
  before do
    allow($stdout).to receive(:write)
  end
end
