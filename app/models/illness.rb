class Illness < ApplicationRecord

  has_many :differentials
  has_many :diffs, :through => :differentials
  has_many :inverse_differentials, class_name: "Differential", :foreign_key => "differential_id"
  has_many :inverse_diffs, :through => :inverse_differentials, source: :illness

  validates_presence_of :name, :category
end
