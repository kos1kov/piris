class DepositsController < ApplicationController

  def index
    @heading = 'Все депозиты'
    @deposit = Deposit.order(:depositUser).all
  end

  def new
    @heading = 'Создание депозита'
    @deposit = Deposit.new
    @user = User.order(:surname).all
  end

  def show
    @deposit = Deposit.find(params[:id]) # id по умолчанию
  end

  def update
    @deposit = Deposit.find(params[:id])
    # @deposit.percentSum = 0

    @deposit.update(:percentSum => 0.0)
    redirect_to @deposit
  end

  def destroy
    @deposit = Deposit.find(params[:id])

    @deposit.destroy
    redirect_to deposits_path
  end

  def closeBankDay
    @deposit = Deposit.all
    # @deposit.percentSum = 0

    @deposit.each do |deposit|
      deposit.update(:percentSum => 1.0)
    end
    redirect_to @deposit
  end

  def create
    # render plain: params[:user].inspect # Проверка работоспособности передачи параметров
    @deposit = Deposit.new(deposit_params)


    # Сохранение поста в БД SQLite
    if(@deposit.save)
      # Вызов метода show
      redirect_to @deposit
    else
      render 'new'
    end
  end


# Какие именно поля разрешены для передачи
  private

  def deposit_params
    params.require(:deposit).permit(:depositUser, :typeOfDeposit, :typeOfCurrency, :sumOfDeposit, :percent, :percentSum)
  end

end
