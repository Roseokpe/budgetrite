class UsersController < ApplicationController

    before_action :set_user, only: [:show]

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    #create new user
    def new
        @user = User.new
    end

    #create new user
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user
        else
            render 'new'
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
end
