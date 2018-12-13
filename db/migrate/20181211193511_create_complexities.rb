class CreateComplexities < ActiveRecord::Migration[5.2]
  def change
    create_table :complexities do |t|
      t.string :comments

      t.timestamps
    end
  end
end
