class CarshoppingsController < ApplicationController
  before_action :set_carshopping, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[index create]

  # GET /carshoppings or /carshoppings.json
  def index
    if current_user.carshopping.nil?
      # Construye un nuevo carshopping asociado al usuario actual
      @carshopping = current_user.build_carshopping(total: 0)
      respond_to do |format|
        if @carshopping.save
          format.html { redirect_to @carshopping, notice: "Carrito creado correctamente." }
          format.json { render :show, status: :created, location: @carshopping }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @carshopping.errors, status: :unprocessable_entity }
        end
      end
    else
      # Si ya existe, redirige directamente al carrito
      redirect_to current_user.carshopping
    end
  end
  
  # GET /carshoppings/1 or /carshoppings/1.json
  def show
    #@carshopping

    #desde el modelo que esta en la tabla auxiliar jalar los datos de los otros modelos de la misma tabla auxiliar
    @products = @carshopping.products
  end

  # GET /carshoppings/new
  def new
    @carshopping = Carshopping.new
    # Buscamos o inicializamos un carrito para el usuario actual

    @carshopping = Carshopping.find_or_initialize_by(user_id: current_user.id)

    if @carshopping.new_record?
      @carshopping.total = 0 
      if @carshopping.save
        redirect_to @carshopping, notice: "Carrito creado exitosamente."
      else
        redirect_to carshoppings_path, alert: "Hubo un problema al crear el carrito."
      end
    else
      
      redirect_to @carshopping
    end

  end

  # GET /carshoppings/1/edit
  def edit
  end

  # POST /carshoppings or /carshoppings.json
  def create

    #Carshopping(user: current_user)
    @carshopping = current_user.carshopping.new(carshopping_params)

    respond_to do |format|
      if @carshopping.save
        format.html { redirect_to @carshopping, notice: "Carrito creado correctamente." }
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
        format.html { redirect_to @carshopping, notice: "Carrito actualizado correctamente." }
        format.json { render :show, status: :ok, location: @carshopping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @carshopping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carshoppings/1 or /carshoppings/1.json
  def destroy
    @carshopping.destroy

    respond_to do |format|
      format.html { redirect_to carshoppings_path, notice: "Carrito eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  private
    
    def set_carshopping
      @carshopping = Carshopping.find_by(id: params[:id])
      unless @carshopping
        redirect_to carshoppings_path, alert: 'Carrito no encontrado.'
      end
    end

    # Solo permitir parámetros confiables para la creación o actualización de un carrito
    def carshopping_params
      params.require(:carshopping).permit(:total)
    end
end
