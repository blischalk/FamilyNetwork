class Tool < ActiveRecord::Base
  has_many :tool_assignments
  has_many :recipes, through: :tool_assignments
end
