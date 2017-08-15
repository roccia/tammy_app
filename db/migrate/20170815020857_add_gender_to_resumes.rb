class AddGenderToResumes < ActiveRecord::Migration[5.1]
  def change
    add_column :resumes, :gender, :string
  end
end
