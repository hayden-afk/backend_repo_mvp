class ApplicationController < ActionController::API

  def login

    #byebug


    user_to_find_to_login = User.find_by( username: params[:username])

    if user_to_find_to_login


        if user_to_find_to_login.authenticate( params[:password] )

            render json: user_to_find_to_login

        else

            render json: {error: "Check password"}
        end

    else

        render json: {error: "Username or Password dont match" }
    end

  end
end
