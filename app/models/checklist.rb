class Checklist < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_many :items
end
