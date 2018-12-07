require ('rspec')
require ('pry')
require ('project')
require ('volunteer')


describe('project') do 

  it('tests a method for project') do

    dummy = project.new()

    expect(dummy.method()).to(eq(expected result))

  end

end

describe('volunteer') do 

  it('tests a method for volunteer') do

    dummy = volunteer.new()

    expect(dummy.method()).to(eq(expected result))

  end

end

