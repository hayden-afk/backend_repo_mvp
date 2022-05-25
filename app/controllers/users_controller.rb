class UsersController < ApplicationController



    def index

        # GET REQUEST

        all_users = User.all

        render json: all_users
    end


    def show

        # GET BY ID

        if user_find_method  # we found a user == TRUTHY == True

            render json: user_find_method

        else # find_by returns nil == FALSY == False

            user_not_found  #User Not Found Method Returning Error Message

        end


    end



    def create

        # POST REQUEST


        new_user = User.create(
            name: params[:name],
            email: params[:email],
            username: params[:username],
            password: params[:password]

        )


        render json: new_user


    end

    def user_update_params

        params.permit(:name, :email, :username, :password)

    end

    def update

        #PATCH REQUEST


        if user_find_method  # Did We Find the User?


            if  user_find_method.update( user_update_params )
                ## OKAY, BUT -- Did the User Update Properly
                ## Are They Now Still Valid?


                    # updated_user = user_find

                    # render json: updated_user

                render json: user_find_method


            else  ## They (the User) ARE NO LONGER VALID  :(

                render json: { errors: user_find_method.errors.full_messages }

            end

        end

    end


    def destroy


        user_to_find = User.find_by( id: params[:id] )

            if user_to_find

                user_to_find.destroy

                render json: {}

                head :no_content

            else

                user_not_found

            end


    end


    private






    def user_find_method

        user_to_find = User.find_by( id: params[:id] )

    end

    def user_not_found
        render json: { error: "User Not Found" }
        # render json: { errors: ["User Not Found"] }
    end



    def user_create_params
        # If You Have Wrap Params
        params.permit(:name, :username, :email, :password)

        # If You Don't Have Wrap Params Disabled
        # params.require(:user).permit(:name, :username, :email, :password)
    end




    def user_update_params
        # If You Have Wrap Params
        params.permit(:name, :username, :email, :password)

        # If You Don't Have Wrap Params Disabled
        # params.require(:user).permit(:name, :username, :email, :password)
    end



    def user_unable_to_create( the_invalid_user_exception )


        # render json: { error: the_invalid_user_exception }
        # {
        #     "error": "Validation failed: Password can't be blank"
        # }


        render json: { errors: the_invalid_user_exception.record.errors.full_messages }
        # {
        #     "errors": [
        #         "Password can't be blank"
        #     ]
        # }


        #X# render json: { errors: the_invalid_user.errors.full_messages }
        ####  When interacting with an Exception - the key-value pairs are set differently
        ####  than directly with the invalid instance


    end








end
