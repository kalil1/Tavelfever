class Item < ApplicationRecord
  belongs_to :activity
  belongs_to :checklist
end
