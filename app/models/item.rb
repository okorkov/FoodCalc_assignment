class Item < ApplicationRecord

  belongs_to :category
  belongs_to :list, optional: true

end
