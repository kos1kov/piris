class CreditsController < ApplicationController
  before_action :set_credit, only: %i[show update destroy]

  # GET /credits
  def index
    @heading = 'Все кредиты'
    @credits = Credit.all
  end

  # GET /credits/1
  def show
    @credit
  end

  # POST /credits
  def new
    @heading = 'Создание кредита'
    @credit = Credit.new
    @user = User.order(:surname).all
    @credit_plan = CreditPlan.order(:name).all
  end

  # PATCH/PUT /credits/1
  def update
    @credit.update(credit_params)
    redirect_to @credit
  end

  # DELETE /credits/1
  def destroy
    @credit.destroy
    redirect_to credits_path

  rescue ActiveRecord::InvalidForeignKey => e
    render_error(:unprocessable_entity, e.inspect)
  end

  def create
    # render plain: params[:user].inspect # Проверка работоспособности передачи параметров
    @credit = Credit.new(credit_params)


    # Сохранение поста в БД SQLite
    if(@credit.save)
      # Вызов метода show
      redirect_to @credit
    else
      render 'new'
    end
  end

  private

  def set_credit
    @credit = Credit.find(params[:id])
  end

  def credit_params
    p params
    params.require(:credit).permit(:credit_plan,:credit_type, :start_date, :end_date, :percent_sum, :percent, :typeOfCurrency, :user, :sum)
  end

  def create_or_update_response
    if @credit.valid?
      render json: @credit
    else
      render json: @credit.errors, status: :unprocessable_entity
    end
  end
end
