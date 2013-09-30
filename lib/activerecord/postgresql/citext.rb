require 'active_record/connection_adapters/postgresql_adapter'

ActiveRecord::ConnectionAdapters::TableDefinition.class_eval do
  def citext(*args)
    options = args.extract_options!
    column(args[0], 'citext', options)
  end
end

ActiveRecord::ConnectionAdapters::Column.class_eval do
  def simplified_type_with_citext_support(field_type)
    if field_type == "citext"
      :citext
    else
      simplified_type_without_citext_support(field_type)
    end
  end
  alias_method_chain :simplified_type, :citext_support
end

ActiveRecord::ConnectionAdapters::PostgreSQLColumn.class_eval do
  def self.extract_value_from_default_with_citext_support(default)
    if default =~ /\A'(.*)'::(?:citext)\z/m
      $1
    else
      extract_value_from_default_without_citext_support(default)
    end
  end
  class << self
    alias_method_chain :extract_value_from_default, :citext_support
  end
end

ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.class_eval do
  def native_database_types_with_citext
    native_database_types_without_citext.merge(
      :citext => { :name => "citext" }
    )
  end
  alias_method_chain :native_database_types, :citext
end

ActiveRecord::ConnectionAdapters::PostgreSQLAdapter::OID.alias_type "citext", "text"
