class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash.now[:success] = "Jūs prisijungėte"
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'El. Pašto adresas/Slaptažodis neteisingi(-as)'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
