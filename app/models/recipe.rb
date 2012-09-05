class Recipe < ActiveRecord::Base
  has_many :ingredient_assignments, :dependent => :destroy
  has_many :ingredients, through: :ingredient_assignments
  has_many :tool_assignments, :dependent => :destroy
  has_many :tools, through: :tool_assignments
  has_many :steps, :dependent => :destroy

  belongs_to :user

  accepts_nested_attributes_for :tools
  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :steps, :allow_destroy => true
  accepts_nested_attributes_for :ingredient_assignments, :allow_destroy => true
  accepts_nested_attributes_for :tool_assignments, :allow_destroy => true
  
  validates_presence_of :title
 end
