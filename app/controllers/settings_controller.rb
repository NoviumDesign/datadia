class SettingsController < ApplicationController

  before_action :authenticate_user!

  def users
    @users = User.all
  end

  def ui
  end

end
