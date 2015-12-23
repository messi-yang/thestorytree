# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

  def add_nickname
    if current_user.update(:nickname=>params[:nickname])
	  render json: {status: "success"}
	else
	  render json: {status: "fail"}  
    end
  end

  def user_params
	params.require(:user).permit(:nickname)
  end

end 