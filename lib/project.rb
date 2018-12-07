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

  def ==(another_project)
    self.title().==(another_author.title()).&(self.id().==(another_author.id()))
  end
end
