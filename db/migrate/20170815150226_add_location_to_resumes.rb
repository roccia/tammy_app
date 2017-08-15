class AddLocationToResumes < ActiveRecord::Migration[5.1]
  def change
    add_column :resumes, :location, :string
  end
end
