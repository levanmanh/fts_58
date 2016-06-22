class LessonsController < ApplicationController
  before_action :logged_in_user

  def index
    @lessons = current_user.lessons
  end
end
