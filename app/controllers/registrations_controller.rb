class RegistrationsController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save 
            redirect_to root_path, notice: "Succesfully created account"
        else
            render :new
        end 


    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end