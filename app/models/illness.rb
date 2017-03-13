class Illness < ApplicationRecord
  has_one :clinical
  has_one :paraclinical
  has_one :treatment
  accepts_nested_attributes_for :clinical, :reject_if => :all_blank, :allow_destroy => true
end
