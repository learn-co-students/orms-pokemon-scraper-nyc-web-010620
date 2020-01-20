require "pry"

class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(keywords)
    end 

    def self.save(name,type,db)
        db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name,type)
    end 

    def self.find(num,db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE id=?",[num])
        p1 = self.new(pokemon) 
        p1.id = pokemon[0][0]
        p1.name = pokemon[0][1]
        p1.type = pokemon[0][2]
        return p1
    end 
end
