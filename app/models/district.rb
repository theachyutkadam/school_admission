class District < ApplicationRecord
  belongs_to :state
  has_many :talukas
  has_many :addresses
end
