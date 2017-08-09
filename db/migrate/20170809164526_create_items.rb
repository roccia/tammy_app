class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :resume_id
      t.string :image

      t.timestamps
    end
  end
end
