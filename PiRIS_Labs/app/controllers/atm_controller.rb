class AtmController < ApplicationController
	def index
    p params[:message]
    p params
    @cards = Card.all
  end

  # def new
  #   @heading = 'Создание депозита'
  #   @deposit = Deposit.new
  #   @user = User.order(:surname).all
  # end

  def show
    @card = Card.find(params[:id]) # id по умолчанию
    if params[:password] == @card.password
      @card
    else
      redirect_to atm_index_path
    end
  end

  def update
    @card = Card.find(params[:id])
    # @deposit.percentSum = 0
		money = @card.money - card_params[:money].to_i
    if money < 0
      redirect_to action: "show", id: @card.id, password: @card.password, message: "Недостаточно средств"
    else
      @card.update(:money => money)
      p @card.id
      redirect_to action: "show", id: @card.id, password: @card.password
    end

  end
  
  def login
    @card = Card.find_by(number: card_params[:number])
    if @card == nil
      redirect_to action: "index", message: "Пароль или номер счета неверный"
    elsif @card.attempt == 3
      redirect_to action: "index", message: "Карта заблокирована"
    elsif @card.password != card_params[:password]
      redirect_to action: "index", message: "Пароль или номер счета неверный"
		  attempt = @card.attempt + 1
      @card.update(:attempt => attempt)
    else
      @card.update(:attempt => 0)
      redirect_to action: "show", id: @card.id, password: @card.password
    end
  end

  def destroy
    redirect_to atm_index_path
  end

  def create
    @card = Card.find_by(number: card_params[:number])
    if @card
      p @card
      redirect_to new_atm_path
    else
    # render plain: params[:user].inspect # Проверка работоспособности передачи параметров
    @card = Card.new(card_params)


    # Сохранение поста в БД SQLite
      if(@card.save)
        # Вызов метода show
        redirect_to atm_index_path
      else
        render 'new'
      end
    end
  end

  private

  def card_params
    p params
    params.require(:card).permit(:number, :password, :money)
  end
end
