class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all 
  end

  def show
    @user = User.find(params[:id])

    @appointment = @user.appointments.new

    @my_appointments = Appointment.get_my_appointments(params[:id])
  end

  def make_app
    @appointment = current_user.appointments.build(appt_params)
    @appointment.appointee_id = params[:id]
    @appointment.save
    redirect_to root_path
  end

  private 

  def appt_params
    params[:appointment].permit(:location, :time, :date)
  end

end
