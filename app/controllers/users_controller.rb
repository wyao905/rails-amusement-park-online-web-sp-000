class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create, :home]
    
    def home
    end

    def index
    end

    def new
        @user = User.new
    end

    def create
        user = User.create(user_params(:name, :password, :happiness, :nausea, :height, :tickets, :admin))
        user.save
        session[:user_id] = user.id
        redirect_to user
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
    end

    def update
    end

    private

    def user_params(*args)
        params.require(:user).permit(*args)
    end

    def require_login
        redirect_to '/' unless session.include? :user_id
    end
end