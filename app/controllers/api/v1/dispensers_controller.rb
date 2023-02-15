class Api::V1::DispensersController < Api::V1::BaseController
  before_action :set_dispenser, only: [:show, :update, :destroy]

  def index
    @dispensers = policy_scope(Dispenser)
  end

  def show
  end

  private

  def set_dispenser
    @dispenser = Dispenser.find(params[:id])
    authorize @dispenser
  end
end
