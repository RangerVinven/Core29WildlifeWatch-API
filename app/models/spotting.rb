class Spotting < ApplicationRecord
  belongs_to :user
  belongs_to :animal
  has_one_attached :image
end
