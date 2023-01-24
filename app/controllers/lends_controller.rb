class LendsController < ApplicationController
  before_action :set_lend, only: %i[ show update destroy ]

  # GET /lends
  def index
    @lends = Lend.all

    render json: @lends
  end

  # GET /lends/1
  def show
    render json: @lend
  end

  # POST /lends
  def create
    @lend = Lend.new(lend_params)

    if @lend.save
      render json: @lend, status: :created, location: @lend
    else
      render json: @lend.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lends/1
  def update
    if @lend.update(lend_params)
      render json: @lend
    else
      render json: @lend.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lends/1
  def destroy
    @lend.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lend
      @lend = Lend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lend_params
      params.require(:lend).permit(:user_id, :book_id, :lend_date)
    end
end
