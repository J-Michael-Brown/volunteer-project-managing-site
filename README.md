# _Volunteer Tracker_

#### _allows a user to track projects and volunteers, December 7th, 2018_

#### By _**J. Michael Brown**_

## Description

_This sit allows a user to add projects. The user may then edit that project to contain volunteers associated with that project. The user may also edit the project title, remove volunteers, or delete the project entirely. Individual volunteers may also be viewed and renamed._

## Setup/Installation Requirements  
Requires:
* psql
* Sinatra
* Capybara (If you want to perform rspecs)

Install:
* _Copy this Project to your Desktop_
* _(Within your computer
  s terminal)_ **Run:**    
  *  **$ createdb volunteer_tracker** _(creates local database to dump tables into)_
  * **$ psql volunteer_tracker < database_backup.sql** _(fills local database with necessary ta)_
  * **$ createdb -T volunteer_tracker volunteer_tracker_test** _(If you want to perform an rspec)_
  * **$ ruby app.rb** _(Starts local host of program)_
* _(Copy the 'port' number that was given to you when you ran $ ruby app.rb) go to the **URL** 'localhost:{your port number}'_
  * Example: 'localhost:4567'  


  You should be Ready to use the app now.

## Known Bugs

_No known bugs yet. Contact me (Michael) via email if you would like to report any._

## Support and contact details

_If any instructions are uncleare contact J. Michael Brown  at this emaail address: @jmichaelbrown132737@gmail.com_

## Technologies Used

_Ruby, Sinatra, Capybara, Postgress sql_

### License

MIT License

Copyright (c) 2018, _J. Michael Brown_  

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:  

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE._
