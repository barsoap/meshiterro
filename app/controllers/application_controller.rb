class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top] #21章 :authenticate_user!とすることによって「ログイン認証されていなければ、ログイン画面へリダイレクトする」機能を実装できます。

  #6章で追記(ストロングパラメータの設定)ここから～
  before_action :configure_permitted_parameters, if: :devise_controller?

  #7章で追記(サインイン,サインアウト後の遷移先設定)
  def after_sign_in_path_for(resource) #サインイン後
    post_images_path
  end
  def after_sign_out_path_for(resource) #サインアウト後
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end # ～ここまで
end
