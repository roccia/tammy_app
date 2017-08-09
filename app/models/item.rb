class Item < ApplicationRecord
  belongs_to :resume
  mount_uploader :image, ResumePicsUploader

end
