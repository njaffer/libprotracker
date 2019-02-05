class CreateEndCycles < ActiveRecord::Migration[5.2]
  def change
    create_table :end_cycles do |t|
      t.belongs_to :card, index: true
      t.integer :card_id	
      t.string :status
      t.string :rationale
      t.string :expected_dur
      t.string :cycle
      t.string :notes   
         
      t.timestamps
    end
  end
end
