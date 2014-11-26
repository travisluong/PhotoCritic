class NewPhotoMailer < ActionMailer::Base
  default from: "admin@photocritic.herokuapp.com"

  def new_photo_email(admin, photo)
    @photo = photo
    mail(to:admin.email, subject: "New photo was uploaded on Photo Critic!")
  end
end
