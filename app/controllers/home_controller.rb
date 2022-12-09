class HomeController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]
    def index
        @user = current_user
        @categories = Category.all
    end
end
