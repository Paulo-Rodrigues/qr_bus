class BusLine < ApplicationRecord
  has_many :bustracks, dependent: :destroy

  validates :from,  :to, :name, presence: true
end
