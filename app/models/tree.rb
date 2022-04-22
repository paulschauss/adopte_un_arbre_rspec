class Tree < ApplicationRecord
  belongs_to :user
  has_many :adoptions, dependent: :destroy

  has_one_attached :photo

  validates :name, :price, :address, :quantity_by_year, :fruit, :description, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity_by_year, numericality: { greater_than: 0 }
  validates :description, length: { in: 20..280 }
  validates :fruit, inclusion: { in: ["Apple",
                                      "Apricot",
                                      "Cherry",
                                      "Chestnut",
                                      "Coconut",
                                      "Fig",
                                      "Grapefruit",
                                      "Hazel",
                                      "Mandarin",
                                      "Mango",
                                      "Mirabellier",
                                      "Mulberry",
                                      "Olivier",
                                      "Orange",
                                      "Pear",
                                      "Plum"]
  }
end
