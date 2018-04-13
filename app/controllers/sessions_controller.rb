class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Jūs prisijungėte"
      redirect_to user
    else
      flash.now[:danger] = 'El. Pašto adresas/Slaptažodis neteisingi(-as)'
      render 'new'
    end
  end

  def destroy

  end
end
