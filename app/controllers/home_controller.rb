class HomeController < ApplicationController
  def index
    @user_count = User.count
    @category_count = Category.count
  end

  def about
  end

  def contactus
  end

  def help
  end
  
end
