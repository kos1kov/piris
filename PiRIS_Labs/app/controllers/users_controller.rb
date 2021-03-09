class UsersController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: '12345',
  except: [:index, :show]

  def index
    @heading = 'Все пользователи'
    @user = User.order(:surname).all
  end

  def new
    @heading = 'Добавление пользователя'
    @user = User.new
  end

  # Отправка пользователя на страницу User
  def show
    @user = User.find(params[:id]) # id по умолчанию
  end

  #Редактирование поста
  def edit
    @heading = 'Изменение пользователя'
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if(@user.update(user_params))
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    redirect_to users_path
  end

  def create
    # render plain: params[:user].inspect # Проверка работоспособности передачи параметров
    @user = User.new(user_params)
    # Сохранение поста в БД SQLite
    if(@user.save)
      # Вызов метода show
      redirect_to @user
    else
      render 'new'
    end
  end


# Какие именно поля разрешены для передачи
  private def user_params
    params.require(:user).permit(:surname, :name, :secondname, :borndate, :sex, :passportserial,
        :passportnum, :issuebody, :dateissue, :identnum, :bornissue, :factcity,
        :factadress, :homephone, :phone, :email, :regaddress, :materialstatus,
        :citizenship, :disability, :pensioner, :monthincome)
  end
end
