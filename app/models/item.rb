class Item < ApplicationRecord
  belongs_to :resume
  mount_uploader :image, ResumePicsUploader
  validates :image, file_size: { less_than_or_equal_to: 10.megabyte ,
                                 message: 'file should be less than %{count}' }


end
