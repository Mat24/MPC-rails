require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { address: @order.address, cc: @order.cc, city: @order.city, country: @order.country, create_date: @order.create_date, dob: @order.dob, email: @order.email, exp_date: @order.exp_date, firts_name: @order.firts_name, last_name: @order.last_name, price: @order.price, product: @order.product, qty: @order.qty, routing: @order.routing, shipping_type: @order.shipping_type, state: @order.state, zip: @order.zip }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { address: @order.address, cc: @order.cc, city: @order.city, country: @order.country, create_date: @order.create_date, dob: @order.dob, email: @order.email, exp_date: @order.exp_date, firts_name: @order.firts_name, last_name: @order.last_name, price: @order.price, product: @order.product, qty: @order.qty, routing: @order.routing, shipping_type: @order.shipping_type, state: @order.state, zip: @order.zip }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
