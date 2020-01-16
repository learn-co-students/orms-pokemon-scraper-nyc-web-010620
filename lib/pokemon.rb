class Pokemon
    attr_reader :id, :name, :type, :db

    def initialize(params)
        @id = params[:id]
        @name = params[:name]
        @type = params[:type]
        @db = params[:db]
    end

    def self.save(poke_name,poke_type,poke_db)
        sql = "INSERT INTO pokemon(name,type) VALUES('#{poke_name}','#{poke_type}');"
        poke_db.execute(sql)
        poke_id = poke_db.execute("SELECT id FROM pokemon ORDER BY id DESC LIMIT 1;")[0][0]
        params = {
            name: poke_name,
            type: poke_type,
            id: poke_id,
            db: poke_db
        }
        Pokemon.new(params)
    end

    def self.find(poke_id,poke_db)
        info = poke_db.execute("SELECT name,type FROM pokemon WHERE id=#{poke_id};")[0]
        puts "#{info}"
        params = {
            name: info[0],
            type: info[1],
            id: poke_id,
            db: poke_db
        }
        Pokemon.new(params)
    end
end
