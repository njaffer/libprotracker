class Card < ApplicationRecord
has_one :complexity
has_one :impact
has_one :strategic_sorting
has_many :comment


end
