# frozen_string_literal: true

module ActiverecordAccessibleJson
  #:nodoc:
  module JsonExtension
    # This patch is strongly dependent with ActiveRecord::Type::Json implementation.
    # https://github.com/rails/rails/blob/8b3fc5ce30629cb098e923396c3eb797365c88d2/activerecord/lib/active_record/type/json.rb#L12
    def deserialize(value)
      return value unless value.is_a?(::String)

      decoded_value = ActiveSupport::JSON.decode(value)
      decoded_value.respond_to?(:with_indifferent_access) ? decoded_value.with_indifferent_access : decoded_value
    rescue StandardError
      nil
    end
  end
end
