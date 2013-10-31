class Users::RegistrationsController < Devise::RegistrationsController
  def update
    super
    @user.image = image_params
    @user.save
  #   uploader = ImageUploader.new
  #   uploader.store!(image_params)
  end

  private

  def image_params
    params[:user].permit(:image)
  end
end
