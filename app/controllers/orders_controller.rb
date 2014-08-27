class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    #El usuario esta autenticado?
    if user_signed_in?
      # Si el usuario es el administrador le muestra todas las ordenes registradas
      if current_user.is_admin == true && current_user.is_admin =! nil
        @orders = Order.all
      else
        #si no solo muestro las ordenes que ha creado el usuario actua
        @orders = Order.where(user_id: current_user.id)
      end
    else
      #Si no esta autenticado lo redirecciona al inicio y muestra una alerta
      redirect_to "/", alert: "Login is required!"
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show

  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create

    @order = Order.new(order_params)
    #recibo el id del usuario actual
    @order.user = current_user
    #guardo la fecha del servidor
    @order.create_date = Date.today

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
      #Existe al menos alguien logeado?
      if user_signed_in?
        if current_user.is_admin == true && current_user.is_admin =! nil?
          @order = Order.find(params[:id])
        else
          #Si el post solicitado no corresponde al usuario, le niega el servicio
          unless @order.user_id == current_user.id
            redirect_to orders_url(@order), alert: "This order is unavariable for you!"
          else
            @order = Order.find(params[:id])
          end
        end
      else
        redirect_to "/", alert: "Login is required!"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:create_date, :firts_name, :last_name, :address, :email, :city, :state, :zip, :country, :dob, :cc, :exp_year, :exp_month, :routing, :product, :qty, :price, :shipping_type, :cvv, :phone, :billing_address, :comments, :user_id)
    end
end
