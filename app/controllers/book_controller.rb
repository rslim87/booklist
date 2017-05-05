class BookController < ApplicationController
	get '/books' do 
		@books = Book.all 
		erb :"books/index"
	end

	get '/books/new' do 
		erb :"books/new"
	end

	post '/books' do 
		@book = Book.create(params[:book])
		if !params["topic"]["name"].empty?
      		@book.topics << Topic.create(name: params["topic"]["name"])
  		end
  		
  		
  		@book.save

  		redirect to "books/#{@book.id}"

	end

	get '/books/:id' do 
		@book = Book.find(params[:id])	
		erb :'books/show'
	end

	get '/books/:id/edit' do 
		@book = Book.find(params[:id])
		erb :'books/edit'
	end

	patch '/books/:id' do 
		@book = Book.find(params[:id])
   		@book.update(params["book"])
    	if !params["topic"]["name"].empty?
      		@book.topics << Topic.create(name: params["topic"]["name"])
    	end
    	redirect "books/#{@book.id}"
  	end

  	delete '/books/:id/delete' do 
  		@book = Book.find(params[:id])
  		@book.delete
  		redirect '/books'
  	end

end
