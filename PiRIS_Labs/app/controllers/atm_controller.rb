class AtmController < ApplicationController
	def index
    @cards = Card.all
		redirect_to action: "show", id: 1
  end

  # def new
  #   @heading = 'Создание депозита'
  #   @deposit = Deposit.new
  #   @user = User.order(:surname).all
  # end

  def show
    @card = Card.find(params[:id]) # id по умолчанию
  end

  def update
    @card = Card.find(params[:id])
    # @deposit.percentSum = 0
		money = @card.money - card_params[:money].to_i
    @card.update(:money => money)
		redirect_to action: "show", id: params[:id]
  end

  # def destroy
  #   @deposit = Deposit.find(params[:id])

  #   @deposit.destroy
  #   redirect_to deposits_path
  # end

  def create
    # render plain: params[:user].inspect # Проверка работоспособности передачи параметров
    @card = Card.new(card_params)


    # Сохранение поста в БД SQLite
    if(@card.save)
      # Вызов метода show
      redirect_to @card
    else
      render 'new'
    end
  end

  private

  def card_params
    params.require(:card).permit(:number, :password, :money)
  end
end
