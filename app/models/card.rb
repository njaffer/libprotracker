class Card < ApplicationRecord
has_one :complexity
has_one :impact
has_many :comment


end
