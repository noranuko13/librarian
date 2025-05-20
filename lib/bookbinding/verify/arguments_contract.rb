# frozen_string_literal: true

require 'dry-validation'

module Bookbinding
  module Verify
    class ArgumentsContract < Dry::Validation::Contract
      params do
        required(:shelve).value(:string)
        required(:jacket).value(:string)
      end
    end
  end
end
