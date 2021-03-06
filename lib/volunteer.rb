class Volunteer
  attr_reader(:name, :project_id, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id, 'NULL')
    @id = attributes.fetch(:id, nil)
  end

  def save
    if @id.class == Integer
      DB.exec("UPDATE volunteers SET (name, project_id) VALUES ('#{@name}', #{@project_id}) WHERE id = #{@id};")
      'database updated'
    else
      result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
      @id = result.first().fetch("id").to_i()
    end
  end

  def self.all
    results = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    results.each do |result|
      name = result.fetch("name")
      project_id = result.fetch("project_id")
      id = result.fetch("id").to_i
      if project_id != 'NULL'
        project_id = project_id.to_i
      end
      volunteer = Volunteer.new({
        :name => name,
        :project_id => project_id,
        :id => id
      })
      volunteers.push(volunteer)
    end
    volunteers
  end

  def self.find(id)
    results = DB.exec("SELECT * FROM volunteers WHERE id = #{id};")
    name = results.first.fetch("name")
    id = results.first.fetch("id").to_i
    project_id = results.first.fetch("project_id")
    if project_id != 'NULL'
      project_id = project_id.to_i
    end
    Volunteer.new({
      :name => name,
      :project_id => project_id,
      :id => id
    })
  end

  def update(attributes)
    @name = attributes.fetch(:name, @name)
    project_id = attributes.fetch(:project_id, @project_id)
    if project_id == nil
      @project_id = 'NULL'
    else
      @project_id = project_id
    end
    @id = attributes.fetch(:id, @id)
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{@id};")
    @id = nil
  end

  def ==(another_volunteer)
    self.name().==(another_volunteer.name())
  end
end
