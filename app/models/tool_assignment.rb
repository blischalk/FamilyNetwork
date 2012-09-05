class ToolAssignment < ActiveRecord::Base
  belongs_to :tool
  belongs_to :recipe
  accepts_nested_attributes_for :tool

  def tool_attributes=(attributes)
    self.tool = Tool.find_or_create_by_title(attributes[:title])
  end
end
