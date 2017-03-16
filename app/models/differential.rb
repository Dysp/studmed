class Differential < ApplicationRecord
  belongs_to :illness
  belongs_to :differential, class_name: "Illness"
end
