class WhishlistsController < ApplicationController
  before_action :set_whishlist, only: %i[ show edit update destroy ]

  # GET /whishlists or /whishlists.json
  def index
    @whishlists = Whishlist.all
  end

  # GET /whishlists/1 or /whishlists/1.json
  def show
  end

  # GET /whishlists/new
  def new
    @whishlist = Whishlist.new
  end

  # GET /whishlists/1/edit
  def edit
  end

  # POST /whishlists or /whishlists.json
  def create
    @whishlist = Whishlist.new(whishlist_params)

    respond_to do |format|
      if @whishlist.save
        format.html { redirect_to @whishlist, notice: "Whishlist was successfully created." }
        format.json { render :show, status: :created, location: @whishlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @whishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /whishlists/1 or /whishlists/1.json
  def update
    respond_to do |format|
      if @whishlist.update(whishlist_params)
        format.html { redirect_to @whishlist, notice: "Whishlist was successfully updated." }
        format.json { render :show, status: :ok, location: @whishlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @whishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /whishlists/1 or /whishlists/1.json
  def destroy
    @whishlist.destroy!

    respond_to do |format|
      format.html { redirect_to whishlists_path, status: :see_other, notice: "Whishlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_whishlist
      @whishlist = Whishlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def whishlist_params
      params.require(:whishlist).permit(:total, :user_id, :product_id)
    end
end
