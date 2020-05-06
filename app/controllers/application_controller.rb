class ApplicationController < ActionController::Base
    #ログイン済みユーザーのみにアクセスを許可する
	before_action :authenticate_user!

	#deviseコントローラーにストロングパラメータを追加
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
		#サインアップジ時にnameのストロングパラメータを追加
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
		#アカウント編集の時にnameとprofileのストロングパラメータを追加
		devise_parameter_sanitizer.permit(:account_update, keys:[:name, :introduction])
	end
end
