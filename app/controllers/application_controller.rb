require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  #   erb :root
  # end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    #binding.pry
    #Model.create(some_attribute: params[:some_attribute])
    @post = Post.create(name: params[:name], content: params[:content])#[:post]) #Create: Model.create
    #erb :index
    redirect '/posts'
  end

  get '/posts' do
    #binding.pry
    #@models = Model.all
    @posts = Post.all #Read: Model.all/Model.find(id_number)
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do
    # @post = Post.find(params[:id])
    @post = Post.find(params[:id])
    @post.delete
    erb :deleted
  end

end
