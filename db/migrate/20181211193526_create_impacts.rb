class CreateImpacts < ActiveRecord::Migration[5.2]
  def change
    create_table :impacts do |t|
      t.string :comments

      t.timestamps
    end
  end
end
