class PostsController < ApplicationController
	def index
		#action rails have 7 routes that use. 
		#Default page with someone access
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :content))
		if @post.save
			redirect_to posts_path, :notice => "Se Ha Creado Post!"
		else
			render "new"
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(params[:post].permit(:title, :content))
			redirect_to posts_path, :notice => "Se Ha Actualizado Post!"
		else
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "Eliminado Satisfactoriamente!"
	end
	#--------------------------------------------------------------------#
	#Se Define El Metodo Para Hacer New Post Y Que Parametros Recibe#
	private
	def post_params
		params.require(:post).permit(:title, :content)
	end
	#--------------------------------------------------------------------#
end