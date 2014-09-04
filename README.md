My-Student-Directory
====================

Student Directory is the Week 1 project I worked on at [Makers Academy](http://www.makersacademy.com).

The main aim of the project is creating an application which allows to create a directory for Makers students.

###The features I implemented via TDD are:

1. The ability to store students with informations such as: name, e-mail, cohort and ID, all assigned from a user.

2. The ability to return the list of students, formatted in a readable way.

3. The ability to delete the students from the list.

4. The ability to save the students in a .csv file, to store them after exiting from the application.

5. The ability to load the students from the csv file and have them displayed in a readable way.

###The programming languages and technologies I used are:

* Ruby

* Rspec

###How to run the application:

* From command line enter: 
```bash
git clone git@github.com:federicomaffei/My-Student-Directory.git
cd My-Student-Directory
ruby lib/student-directory-app.rb
```

###How to test the application:

* From command line enter:
```bash
git clone git@github.com:federicomaffei/My-Student-Directory.git
cd My-Student-Directory
rspec
```
###Possible future adds to the features:

* Assign incremental ID to students, to avoid user entering multiple entries with same ID.

* Throw exception messages when the user input is not consistent.


