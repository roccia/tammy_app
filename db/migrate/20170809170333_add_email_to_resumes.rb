class AddEmailToResumes < ActiveRecord::Migration[5.1]
  def change
    add_column :resumes, :email, :string
  end
end
