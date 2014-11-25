class NewPhotoMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_photo_email(admin, photo)
    @photo = photo
    mail(to:admin.email, subject: "New photo was uploaded on Photo Critic!")
  end
end