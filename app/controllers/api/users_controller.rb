class Api::UsersController < Api::BaseController
  before_action :authenticate_user!

  def me
    json_response current_user
  end
end
