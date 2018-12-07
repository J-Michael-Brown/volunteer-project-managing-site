class Work
  attr_reader(:time_start, :time_end)

  def initialize(attributes)
    @project_id = attributes.fetch(:project_id)
    @volunteer_id = attributes.fetch(:volunteer_id)
    @time_start = attributes.fetch(:time_start, Time.now())
    @time_end = attributes.fetch(:time_end, 'NULL')
  end

  def save
    result = DB.exec("INSTER INTO works (project_id, volunteer_id, time_start, time_end) VALUES ()")
  end

  def seconds(new_time, Time.now)
    Time.now() - @time_start
  end

  def hours(new_time, Time.now)
    self.workseconds(new_time)/3600
  end

  def all
    results = DB.exec("SELECT * FROM works;")
    works = []
    results.each do |result|
      volunteer_id = result.fetch("volunteer_id")
      project_id = result.fetch("project_id")
      time_start = result.fetch("time_start")

      if project_id != 'NULL'
        project_id = project_id.to_i
      end
      volunteer = Volunteer.new({
        :volunteer_id => volunteer_id,
        :project_id => project_id,
        :time_start => time_start
      })
      works.push(volunteer)
    end
    works
  end
end
