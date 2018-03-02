class Checklist < ApplicationRecord
  belongs_to :user
  has_many :activity
  has_many :items
end
