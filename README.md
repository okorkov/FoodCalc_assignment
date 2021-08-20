# FoodCalc Assignment

Thank you for allowing me to build a simple application to show my skill set.

I've decided to build the application entirely on rails as it's a great framework supporting the MVC architecture. 

Application is posted on Heroku and can be accessed here https://foodcalcapp.herokuapp.com/

GitHub  Repo: https://github.com/okorkov/FoodCalc_assignment

I haven't spent much time on Javascript nor CSS and mostly focused on the CRUD functionality of the application.

First, I'll start with the decision I made to seed the database from a CSV file. By running rake db:seed it will populate the database from the giving file that locates in db folder. I used 'CSV.foreach' loop provided to me by rails to iterate through rows and and wrote a class method 'CreateFromCSV.createNewItem' that will create items and will assign them to the categories.

Tables:
users - brypt gem for authentication, also, set up google auth with omniauth for log in/signup convenience. User has many lists.

lists - lists has_many items, support full CRUD functionality. I mostly used rails form_for to prepopulate data when editing lists.

items - belongs_to category and to the list as well.

category - has_many items.

If I had more time  I'd chose to build the front end on React to make the user's experience seamless and smoother by making async calls to the backend while making changes or moving items in the list around etc.

Haven't really encountered any challenges yet as I was very much familiar with the task and have done similar things in the past.
