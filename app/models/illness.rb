class Illness < ApplicationRecord
  has_one :clinical, inverse_of: :illness
  has_one :paraclinical, inverse_of: :illness
  has_one :treatment, inverse_of: :illness
  accepts_nested_attributes_for :clinical, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :paraclinical, :reject_if => :all_blank, :allow_destroy => true

  validates_presence_of :etiology, :patogenesis, :incidence, :category, :anamnesis, :name, :description
end
