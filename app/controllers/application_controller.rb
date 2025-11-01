class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Deviseの画面では認証を要求しない（リダイレクトループ回避）
  before_action :authenticate_user!, unless: :devise_controller?

  # Devise画面は nav なしの専用レイアウトに切替
  layout :layout_by_resource

  private

  def layout_by_resource
    devise_controller? ? "devise" : "application"
  end
end
