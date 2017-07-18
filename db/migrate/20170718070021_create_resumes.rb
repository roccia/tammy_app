class CreateResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :mobile_number
      t.string :birthday
      t.string :college
      t.text :introduction
      t.string :resume_url

      t.timestamps
    end
  end
end
