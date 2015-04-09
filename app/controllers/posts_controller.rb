class PostsController < ApplicationController

	before_action :all_tasks, only: [:index, :create]
  	respond_to :html, :js

	def index
	  	@posts = Post.all

	  	respond_to do |format|
	    	format.html
	    	format.json
	  	end
	end

	def new
		@post = Post.new
	end

	def create
		#@post = Post.new(params[:post].permit(:title, :content))
		#if @post.save
			#redirect_to posts_path, :notice => "Se Ha Creado Post!"
		#else
			#render "new"
		#end
		@post  = Post.create(post_params)
		params[:esconder]="nada"
	end

	def edit
		@todos = Post.all
		@post = Post.find(params[:id])
	end

	def show
		@todos = Post.all
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(params[:post].permit(:title, :content))
			respond_to do |format|
				format.html { redirect_to posts_path, :notice => "Se Ha Actualizado Post!" }
			end	
		else
			render "edit"
		end
	end

	def destroy
		@todos = Post.all
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "Eliminado Satisfactoriamente!"
	end
	#--------------------------------------------------------------------#
	#Se Define El Metodo Para Hacer New Post Y Que Parametros Recibe#
	private
	def all_tasks
      @todos = Post.all
    end
	def post_params
		params.require(:post).permit(:title, :content)
	end
	#--------------------------------------------------------------------#
end
