class EditorialsController < ApplicationController
  before_action :set_editorial, only: %i[ show edit update destroy ]

  # GET /editorials or /editorials.json
  def index
    @editorials = Editorial.all
  end

  # GET /editorials/1 or /editorials/1.json
  def show
  end

  # GET /editorials/new
  def new
    @editorial = Editorial.new
  end

  # GET /editorials/1/edit
  def edit
  end

  # POST /editorials or /editorials.json
  def create
    @editorial = Editorial.new(editorial_params)

    respond_to do |format|
      if @editorial.save
        format.html { redirect_to @editorial, notice: "Editorial was successfully created." }
        format.json { render :show, status: :created, location: @editorial }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @editorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editorials/1 or /editorials/1.json
  def update
    respond_to do |format|
      if @editorial.update(editorial_params)
        format.html { redirect_to @editorial, notice: "Editorial was successfully updated." }
        format.json { render :show, status: :ok, location: @editorial }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @editorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editorials/1 or /editorials/1.json
  def destroy
    @editorial.destroy!

    respond_to do |format|
      format.html { redirect_to editorials_path, status: :see_other, notice: "Editorial was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editorial
      @editorial = Editorial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def editorial_params
      params.require(:editorial).permit(:name)
    end
end
