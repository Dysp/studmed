class Clinical < ApplicationRecord
  belongs_to :illness, inverse_of: :clinical
end
