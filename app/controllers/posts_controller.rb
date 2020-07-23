class PostsController < ApplicationController
  http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", except: [:index] 

  def index
    @posts = Post.order("created_at DESC")
  end

  def create

    temp_content = params[:post][:content].gsub! 'spoiler', ''
    temp_content = params[:post][:content].gsub! 'SPOILER', ''

    @post = Post.create(
      title: params[:post][:title], 
      image_url: params[:post][:image_url],      
      content: params[:post][:content]
    )

      if @post.save
        redirect_to root_path, notice: 'El post fue subido exitosamente!'
      else
        redirect_to root_path, notice: 'Error al subir el post'
      end 

  end

  def dashboard
    @post = Post.new
  end

end
