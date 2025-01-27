class ListProductsController < ApplicationController
  before_action :set_list_product, only: %i[ show edit update destroy remove_from_cart  ]
  
  

  # GET /list_products or /list_products.json
  def index
    @list_products = ListProduct.all
  end

  # GET /list_products/1 or /list_products/1.json
  # /list_products/add_to_list
  # user_id product_id carshopping
  #
  def show
  end

  # GET /list_products/new
  def new
    @list_product = ListProduct.new
  end

  # GET /list_products/1/edit
  def edit
  end

  # POST /list_products or /list_products.json
  def create
    @list_product = ListProduct.new(list_product_params)

    respond_to do |format|
      if @list_product.save
        format.html { redirect_to @list_product, notice: "List product was successfully created." }
        format.json { render :show, status: :created, location: @list_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_to_list
    #crear un nuevo registro tipo ListProduct(user: current, product: params, carshopping: current_user.carshopping)

    #obtener el product_id -> lo envia el boton por parametros
    #user_id -> current_user
    #carshopping -> current_user.carshoppingf

    carrito = current_user.carshopping
    product_id = params[:list_product][:product_id]
    @list_product = ListProduct.new(
      product_id: product_id, 
      user_id: current_user.id, 
      carshopping_id: carrito.id)
    
    puts "==========================="
    puts "AGREGANDO AL CARRITO"
    puts "usuario: #{current_user.id}"
    puts "carrito: #{carrito.id}"
    puts "produto: #{product_id}"
    puts "lista de producto: #{@list_product.inspect}"
    puts "==========================="

    respond_to do |format|
      if @list_product.save
        #actualizar el total de carrito (variable carrito)
        producto = Product.find(product_id)
        carrito.actualizar_total(producto.price)
        format.html{redirect_to carshopping_path(carrito), notice: 'producto agregado al carrito'}
      else
        format.html{redirect_to root_path, status: :unprocessable_entity,alert: 'producto agregado al carrito'}

        puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        puts "ERRORES"
        puts @list_product.errors.full_messages
        puts "----------------------------"
      end
    end

    




  end

  # PATCH/PUT /list_products/1 or /list_products/1.json
  def update
    respond_to do |format|
      if @list_product.update(list_product_params)
        format.html { redirect_to @list_product, notice: "List product was successfully updated." }
        format.json { render :show, status: :ok, location: @list_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def shop_from_cart
    puts "==========================="
    puts "hola"
    puts "==========================="

    @list_products = current_user.carshopping.list_products

    puts "==========================="
    puts "#{@list_products}"
    puts "==========================="


    if @list_products.empty?
      redirect_to carshopping_path(current_user.carshopping), alert: 'No hay productos en el carrito para realizar la compra.'
      return
    end

    total_price = current_user.carshopping.total

    
    @list_products.each do |list_product|
      list_product.destroy
    end

    
    current_user.carshopping.update(total: 0)

    
    redirect_to carshopping_path(current_user.carshopping), notice: "Compra realizada con éxito. Total gastado: $#{total_price}."



  end

  
  def remove_from_cart
    carrito = current_user.carshopping

    
    product_price = @list_product.product.price

    @list_product.destroy

    carrito.actualizar_total(-product_price)


    redirect_to carshopping_path(current_user.carshopping), notice: 'Producto eliminado del carrito'
  end

  # DELETE /list_products/1 or /list_products/1.json
  def destroy
    @list_product.destroy!

    respond_to do |format|
      format.html { redirect_to list_products_path, status: :see_other, notice: "List product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_product
      @list_product = ListProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_product_params

      #params = {"list_product" => "1", "product_id" => "2"}
      
      #params = {"product_id" => "2"}

      params.require(:list_product).permit(:product_id)
    end
end
