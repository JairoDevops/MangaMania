class CarshoppingsController < ApplicationController
  before_action :set_carshopping, only: %i[ show edit update destroy ]

  # GET /carshoppings or /carshoppings.json
  def index
    @carshoppings = Carshopping.all
  end

  # GET /carshoppings/1 or /carshoppings/1.json
  def show
  end

  # GET /carshoppings/new
  def new
    @carshopping = Carshopping.new
  end

  # GET /carshoppings/1/edit
  def edit
  end

  # POST /carshoppings or /carshoppings.json
  def create
    @carshopping = Carshopping.new(carshopping_params)

    respond_to do |format|
      if @carshopping.save
        format.html { redirect_to @carshopping, notice: "Carshopping was successfully created." }
        format.json { render :show, status: :created, location: @carshopping }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @carshopping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carshoppings/1 or /carshoppings/1.json
  def update
    respond_to do |format|
      if @carshopping.update(carshopping_params)
        format.html { redirect_to @carshopping, notice: "Carshopping was successfully updated." }
        format.json { render :show, status: :ok, location: @carshopping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @carshopping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carshoppings/1 or /carshoppings/1.json
  def destroy
    @carshopping.destroy!

    respond_to do |format|
      format.html { redirect_to carshoppings_path, status: :see_other, notice: "Carshopping was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carshopping
      @carshopping = Carshopping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def carshopping_params
      params.require(:carshopping).permit(:total, :user_id, :product_id)
    end
end
