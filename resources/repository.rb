actions :create, :delete
default_action :create

attribute :directory, default: nil, kind_of: String, name_attribute: true
attribute :group, default: nil, kind_of: String
attribute :repository, default: nil, kind_of: String
attribute :user, default: nil, kind_of: String

attr_accessor :exists
