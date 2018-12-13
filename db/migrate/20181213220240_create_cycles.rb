class CreateCycles < ActiveRecord::Migration[5.2]
  def change
    create_table :cycles do |t|
      t.string :cycle_name
      t.string :duration

      t.timestamps
    end
  end
end
