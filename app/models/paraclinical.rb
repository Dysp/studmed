class Paraclinical < ApplicationRecord
  belongs_to :illness, inverse_of: :paraclinical
  has_one :bloodsample
  has_one :test
end
