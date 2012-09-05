class Step < ActiveRecord::Base
  belongs_to :recipe
  validates_presence_of :description, message: "^A recipe must include at least one step"
end
