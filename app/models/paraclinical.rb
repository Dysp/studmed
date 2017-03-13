class Paraclinical < ApplicationRecord
  belongs_to :illness
  has_one :bloodsample
  has_one :test
end
