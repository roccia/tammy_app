class AddCvImagesToResumes < ActiveRecord::Migration[5.1]
  def change
    add_column :resumes, :cv_images, :string
  end
end
