class Paraclinical < ApplicationRecord
  belongs_to :illness, inverse_of: :paraclinical
  has_one :bloodsample
  has_one :test, inverse_of: :paraclinical

  accepts_nested_attributes_for :test, :reject_if => :all_blank, :allow_destroy => true

end
