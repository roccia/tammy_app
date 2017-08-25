class Resume < ApplicationRecord
  has_many :items
  accepts_nested_attributes_for :items
  paginates_per 25

end
