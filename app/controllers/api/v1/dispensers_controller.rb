class Api::V1::DispensersController < Api::V1::BaseController
  def index
    @dispensers = policy_scope(Dispenser)
  end
end
