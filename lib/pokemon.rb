class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id_num, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = (?)
    SQL

    response = db.execute(sql, id_num)[0]

    Pokemon.new(id: response[0], name: response[1], type: response[2], db: db)
  end


end
