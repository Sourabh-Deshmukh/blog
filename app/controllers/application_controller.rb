class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
before_action :authenticate_user!, except: [:index, :show]

# def upload
#  uploaded_io = params[:picture]
#  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
#    file.write(uploaded_io.read)
#  end
# end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:first_name, :last_name, :mobile, :image, user_address_attributes: [:address]])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :mobile, user_address_attributes: [:address]])

  end	 

# def configure_permitted_parameters
#         devise_parameter_sanitizer.for(:sign_up) do |u|
#           u.permit(:email,:first_name, :last_name, :address)
#         end
#       end

end
