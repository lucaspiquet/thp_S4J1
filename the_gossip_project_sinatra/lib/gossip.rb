require 'csv'

class Gossip
	attr_accessor :author, :content

	# on définit les variables d'instance en les passant en paramètres
  def initialize(author, content)
    @author = author
    @content = content
  end

	def save
  	CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [@author, @content]
  	end
	end

	# 2.5.1. : chacune des lignes est un objet, que l'on range dans un array (index des gossips)
	def self.all
  	all_gossips = []
  	CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  	end
  return all_gossips
	end

	# 2.6.3. : la ligne dans le CSV correspond à l'id, que l'on doit mettre à la fin de l'URL
	def self.find(id)
  gossips = []   # permet de stocker la ligne csv demandée
  CSV.read("./db/gossip.csv").each_with_index do |csv_line, index|
    if (id == index+1)          # cherche et check si l'index est égale id demandé
      gossips << Gossip.new(csv_line[0], csv_line[1])    # si trouvé, ajout dans array et break pour retourner l'array
      break
        end
      end
      return gossips
  end

end