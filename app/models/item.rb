class Item < ApplicationRecord
  belongs_to :activity
  has_and_belongs_to_many :checklist
end
