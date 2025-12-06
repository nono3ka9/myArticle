# class Admin::UsersController < ApplicationController
#     before_action :admin_basic_auth

#     def index
#         @users = User.order(:id)
#     end

#     def show
#         @user = User.find(params[:id])
#     end

#     private

#     #ベーシック認証
#     def admin_basic_auth
#         auth = Rails.application.config.x.admin_basic_auth

#         authenticate_or_request_with_http_basic('Admin Area') do |username, pw|
#             username == auth[:user] && pw == auth[:password]
#         end
#     end
# end

module Admin
  class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end
  end
end
