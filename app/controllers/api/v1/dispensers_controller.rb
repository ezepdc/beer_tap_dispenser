class Api::V1::DispensersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:index, :show]
  before_action :set_dispenser, only: [:show, :update, :destroy]

  def index
    @dispensers = policy_scope(Dispenser)
  end

  def show
  end

  def update
    if @dispenser.update(dispenser_params)
      render :show
    else
      render_error
    end
  end

  def create
    @dispenser = Dispenser.new(dispenser_params)
    @dispenser.user = current_user
    authorize @dispenser
    if @dispenser.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_dispenser
    @dispenser = Dispenser.find(params[:id])
    authorize @dispenser
  end

  def dispenser_params
    params.require(:dispenser).permit(:opened_at, :closed_at, :flow_volume, :price)
  end

  def render_error
    render json: { errors: @dispenser.errors.full_messages },
      status: :unprocessable_entity
  end
end
