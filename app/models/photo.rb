class Photo < ActiveRecord::Base
  # has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100#" }
  # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # validates_attachment_presence :image
  mount_uploader :pic, PhotoUploader
  validates :title, presence: true
  belongs_to :user
end
