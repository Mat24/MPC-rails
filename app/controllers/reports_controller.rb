class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  # GET /reports
  # GET /reports.json
  def index
    if user_signed_in?
      # Si el usuario es el administrador le muestra todas las ordenes registradas
      if current_user.is_admin == true && current_user.is_admin =! nil
        @reports = Report.all
      else
        @reports = Report.where(id_user:  current_user.id)
      end
    else
      redirect_to "/", alert: "Login is required!"
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    if current_user.is_admin == true && current_user.is_admin =! nil
      @report = Report.new
    else
      redirect_to "/", alert: "this option is only avariable for administrator users"
    end
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    if current_user.is_admin == true && current_user.is_admin =! nil
      @report = Report.new(report_params)
      @report.id_user = @report.order.user_id
      puts "---------------------------------"
      puts "#{@report.order.price}"
      puts "---------------------------------"
      @report.commission = 0.4 * (@report.order.price - 25)
      respond_to do |format|
        if @report.save
          format.html { redirect_to @report, notice: 'Report was successfully created.' }
          format.json { render :show, status: :created, location: @report }
        else
          format.html { render :new }
          format.json { render json: @report.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to "/", alert: "this option is only avariable for administrator users"
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:date_report, :status, :descriptor, :payment, :delivery, :settled, :commission, :account_dest,:order_id, :id_user, :tracking_number)
    end
end
