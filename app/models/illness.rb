class Illness < ApplicationRecord
  has_one :clinical, inverse_of: :illness
  has_one :treatment, inverse_of: :illness
  has_one :test, inverse_of: :illness

  has_many :differentials
  has_many :diffs, :through => :differentials
  has_many :inverse_differentials, class_name: "Differential", :foreign_key => "differential_id"
  has_many :inverse_diffs, :through => :inverse_differentials, source: :illness

  accepts_nested_attributes_for :clinical, :allow_destroy => true
  accepts_nested_attributes_for :test, :allow_destroy => true

  validates_presence_of :etio_and_pato, :incidence, :category, :name, :description
end
