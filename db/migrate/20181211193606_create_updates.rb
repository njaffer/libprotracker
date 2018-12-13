class CreateUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :updates do |t|
      t.string :comments
      t.string :uname
      t.datetime :updated_on

      t.timestamps
    end
  end
end
