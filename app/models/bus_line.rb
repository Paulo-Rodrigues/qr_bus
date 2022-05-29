class BusLine < ApplicationRecord
  validates :from,  :to, :name, presence: true
end
