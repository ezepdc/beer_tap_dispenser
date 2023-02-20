class Api::V1::DispensersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:update, :show]
      # , except: [:index, :show]
  before_action :set_dispenser, only: [:show, :update]

  # def index
  #   @dispensers = policy_scope(Dispenser)
  # end

  def show
    render :money_spent
  end

  # def update
  #   if @dispenser.update(dispenser_params)
  #     render :show
  #   else
  #     render_error
  #   end
  # end

  def create
    @dispenser = Dispenser.new(dispenser_params)
    @dispenser.user = current_user
    @dispenser.price = 12.25
    authorize @dispenser
    if @dispenser.save
      render :create, status: :created
    else
      render_error
    end
  end

  # def dispenser_status
  def update
    id = params[:id]
    if @dispenser.status(id) == "open"
      @spending = Spending.where(dispenser: id).last
      @spending.closed_at = Time.now
      @spending.total_spent = (@spending.closed_at - @spending.opened_at) * @spending.flow_volume * Dispenser.find_by(id: id).price
      @spending.save
      @dispenser.amount = Spending.where(dispenser: id).sum { |s| s.total_spent }
      @dispenser.save
      render :dispenser_status, status: :created
    else
      @spending = Spending.new(
        dispenser: @dispenser,
        opened_at: Time.now,
        flow_volume: @dispenser.flow_volume
      )
      render :dispenser_status, status: :created if @spending.save
    end
  end

  private

  def set_dispenser
    @dispenser = Dispenser.find(params[:id])
    authorize @dispenser
  end

  def dispenser_params
    params.require(:dispenser).permit(:flow_volume)
  end

  def render_error
    render json: { errors: @dispenser.errors.full_messages },
      status: :unprocessable_entity
  end
end
