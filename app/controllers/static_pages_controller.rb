class StaticPagesController < ApplicationController

  def home
    puts "********home => current_user??************"
    puts @current_user
  end

  private

  def not_connected
  end

end
