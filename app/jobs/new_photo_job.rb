NewPhotoJob = Struct.new(:photo) do
  def perform
    AdminUser.all.each do |admin|
      NewPhotoMailer.new_photo_email(admin, photo).deliver
    end
  end
end