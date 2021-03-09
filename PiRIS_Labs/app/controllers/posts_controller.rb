class PostsController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: '12345',
  except: [:index, :show]

  def index
    @heading = 'Все пользователи'
    @post = Post.all
  end

  def new
    @heading = 'Добавление пользователя'
    @post = Post.new
  end

  # Отправка пользователя на страницу post
  def show
    @post = Post.find(params[:id]) # id по умолчанию
  end

  #Редактирование поста
  def edit
    @heading = 'Изменение пользователя'
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if(@post.update(post_params))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to posts_path
  end

  def create
    # render plain: params[:post].inspect # Проверка работоспособности передачи параметров
    @post = Post.new(post_params)
    # Сохранение поста в БД SQLite
    if(@post.save)
      # Вызов метода show
      redirect_to @post
    else
      render 'new'
    end
  end

# Какие именно поля разрешены для передачи
  private def post_params
    params.require(:post).permit(:surname, :name, :secondname)
  end
end
