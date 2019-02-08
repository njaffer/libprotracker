class Card < ApplicationRecord
has_one :complexity
has_one :impact
has_one :strategic_sorting
has_many :comment
has_many :end_cycle

def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end
  
end
