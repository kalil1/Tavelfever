class Useritem < ApplicationRecord
  belongs_to :user
  belongs_to :checklist
end