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

  def ==(another_project)
    self.title().==(another_author.title()).&(self.id().==(another_author.id()))
  end
end
