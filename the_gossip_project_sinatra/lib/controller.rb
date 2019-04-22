require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
  	erb :index, locals: {gossips: Gossip.all}
	end

	# url pour créer un gossip
	get '/gossips/new/' do
    erb :new_gossip
  end

  # 2.4.1.: création de l'entrée + sauvegarde dans un fichier gossip.csv
  post '/gossips/new/' do 
  	Gossip.new(params["gossip_author"], params["gossip_content"]).save
  	redirect '/' # 2.4.3. : redirection vers la page d'accueil après sauvegarde de l'entrée
	end

	# affiche un gossip en particulier, grâce à son id
  get '/gossips/:id' do
    erb :show, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

end