#Controller for manipulating users.
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    #make sure the user is valid, otherwise just show all users
    if @user.nil?
      @users = User.all
      render :index, :alert => "User not found!" and return
    end
    @raw_data_sets = @user.raw_data_sets
  end

  def index
    @users = User.all
  end

end
