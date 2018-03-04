class Checklist < ApplicationRecord
  belongs_to :user
  has_many :activity
  has_and_belongs_to_many :items
end
