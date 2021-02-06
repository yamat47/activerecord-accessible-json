# frozen_string_literal: true

require 'activerecord_accessible_json/json_extension'

module ActiverecordAccessibleJson
  class Railtie < ::Rails::Railtie
    initializer 'activerecord_accessible_json' do |_app|
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Type::Json.prepend ActiverecordAccessibleJson::JsonExtension
      end
    end
  end
end
