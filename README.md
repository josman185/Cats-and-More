# Table of Contents  
[Description](#Description)  

[Getting started](#Gettingstarted)

[Architecture](#Architecture)

[Structure](#Structure)

[Runing the test](#Runingthetest)

[Deployment](#Deployment)

[Workflow](#Workflow)

[API](#API)


# Cats and More App

This is a little Shopping App that shows different items to users.

# Description

The Cats and More App is a simple App built for iOS devices.
It has a minimalist design that allows you to navigate through out diferent products.
The project consist in a few screens that shows you diferrent products.

# Getting started

1. Make sure you have installed Xcode 15.0 and above.
2. Download the project files from the repository.
3. Open the project files in Xcode.
4. Run the code and make sure there are no warnings or errors.
5. Run the active Scheme.
   You shoud see the main screen with to Tabs (Shopping, Cats)

# Architecture

- Cats and More App is implemented usind the **Model View ViewModel (MVVM)** desing pattern.
- Model has any necessary data to handle the information
- View is responsible for displaying the information to the user.
- ViewModel handles the business logic as well as it enables a better testing.
- Project does not have a data base it makes Restful API calls.

# Structure
- "Screens": The diferent screens conforming the App.
- "Model": The Data to process the information to the user.
- "Utilities": Diferent components like UI components, Network Managers, Alerts that can be used through out the project.

# Runing the test
The Cats and More project can be tested using the built-in framework XCTest.
To start testing the project just go to the Test Navigator in Xcode and clic on the first rhomboid (runs all the test).
To run all the UI test follow the same steps but this time clic the (UITest rhomboid).

# Deployment
Keep in mind that deploying an iOS app to the App Store requires having an Apple Developer account.

  1. Click on the "Product" menu in Xcode and select "Archive." This will create an archive of your project.
  2. Once the archive has been created, select it in the Organizer window and click on the "Validate" button to perform some preliminary tests on the app.
  3. Once validation is complete, click on the "Distribute" button and select "Ad Hoc" or "App Store" distribution. This will create a signed IPA file that can be installed on iOS devices.
  4. Follow the prompts in the distribution wizard to complete the distribution process.
  5. Once the distribution is complete, you can use the IPA file to install the app on iOS devices

# Workflow

Reporting bugs:
If you come across any issues while using the App, please report them by creating a new issue on the GitHub repository.

    Reporting bugs form:

    App version: 2.12
    iOS version: 16.1
    Description: When I tap on the "OK" button, the App does not respond.
    Steps to reproduce: Open "Screen" flow of the app, press "X" button.


  Submitting pull requests:
  If you have a bug fix or a new feature you'd like to add, please submit a pull request. Before submitting a pull request, please make sure that your changes are well-tested and that your code adheres to the Swift style guide.

  Improving documentation:
  If you notice any errors or areas of improvement in the documentation, feel free to submit a pull request with your changes.

  Providing feedback:
  If you have any feedback or suggestions for the Cats and More project, please let us know by creating a new issue or by sending an email to the project maintainer.

# API
- We are using a REST API
- API url is [here](https://dummyjson.com/products)
- For HTTP networking we are using: [URLSession](https://developer.apple.com/documentation/foundation/urlsession)


