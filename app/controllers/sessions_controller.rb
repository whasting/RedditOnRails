class SessionsController < ApplicationController

  def new
    # email, password
  end

  def create
    item = User.find_by_credentials(params[:email], params[:password])
    if item
      login!(item)
      redirect_to user_url(item)
    else
      flash[:errors] = ["Invalid credentials"]
      redirect_to new_session_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
