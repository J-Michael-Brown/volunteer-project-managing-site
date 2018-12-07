class Project

  attr_reader(:title, :id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id, nil)
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def all
    results = DB.exec("SELECT * FROM projects;")
    projects = []
    results.each do |result|
      title = result.fetch("title")
      id = result.fetch("id").to_i
      project = Project.new({:title => title, :id => id})
      projects.push(project)
    end
    projects
  end

  def self.find(id)
    results = DB.exec("SELECT * FROM projects WHERE id = #{id};")
    title = results.first.fetch("title")
    id = results.first.fetch("id").to_i
    Project.new({:title => title, :id => id})
  end

  def volunteers
    results = DB.exec("SELECT * FROM volunteers WHERE project_id = #{@id};")
    volunteer_array = []
    results.each do |result|
      title = result.fetch("title")
      id = result.fetch("id").to_i
      project_id = result.fetch("project_id").to_i
      volunteer = Project.new({
        :title => title,
        :id => id,
        :project_id => project_id
      })
      volunteer_array.push(volunteer)
    end
    volunteer_array
  end

  def update(attributes)
    new_title = attributes.fetch(:title)
    new_id = attributes.fetch(:id, @id)
    if new_id == nil
      id_insert = "NULL"
    else
      id_insert = new_id
    end
    DB.exec("UPDATE projects SET (title, id) VALUES ('#{new_title}', #{id_insert}) WHERE id = #{@id};")
    @id = new_id
    @title = new_title
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
    DB.exec("UPDATE volunteers SET project_id = NULL WHERE project_id = #{@id};")
  end

  def ==(another_project)
    self.title().==(another_project.title())
  end
end
