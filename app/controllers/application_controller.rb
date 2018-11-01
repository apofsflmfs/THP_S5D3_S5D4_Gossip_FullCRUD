class ApplicationController < ActionController::Base
  @@session = nil
  before_action :set_session

  def self.set_session(user)
    @@session = user
  end

  def self.get_session
    return @@session
  end

  def set_session
    @current_user = ApplicationController.get_session
  end

end
