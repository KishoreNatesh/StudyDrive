# Studydrive Robotframework

# Project strucutre - 

PageObjects - contains all keywords for each page objects based on components as folder

Resources - contains configurations and test data

TestSuites  - contains test suites for each component


# Bugs - 
1. png files are not viewable.
2. We need to restrict user with valid info on what type of files are allowed to upload

# To run test suites - 

For optimal performance, it is advisable to include Python and Python\Scripts in your environment variables before executing the command below. Otherwise, you must prefix the robot command with "python -m."

command - python -m robot -d ./results .\TestSuites\Login.robot

command - robot -d ./results .\TestSuites\Login.robot


The purpose of this command is to execute parallel tests, utilizing the "--testlevelsplit" option to run all test cases concurrently within a given test suite.

command - pabot --processes 4 --testlevelsplit -d ./results .\TestSuites\Login.robot

# Q/A sections
1. Please provide us with the email address you used to create the user account
    * kishore.studydrive@gmail.com   password-Studydrive@123

2. How would you ensure the process is bug-free?
    * Perform requirements analysis to gather knowledge about the story for test planning and design.
    * Execute tests such as smoke tests, functional testing, UAT, and raise defects if found.
    * Perform regression testing.

3. How would you ensure the process works after each release?
    * Maintain effective communication and collaboration within the team.
    * Follow Agile standards and practices.
    * Implement test automation with CI/CD integration for each development build.

4. What are the best practices that a QA can introduce/implement in a team to achieve the best possible outcomes in a delivery process?
    * Continuous learning and understanding from a customer's perspective.
    * Encouraging and promoting ideas for improvement.
    * Implementing test automation and following industry best practices.
 
5. Additional ideas/steps to make the upload process flawless -
    * We need to maximum validate file size upload to test the limit of 100mb and beyond.
    * Need to implement file type restriction.
    * If there is a network error then we need to make sure we throw error accordingly.
    * Then provide retry upload option.

*Note: I have recently started working with Appium. Although I was new to it, I managed to install all the necessary requirements and began automating tests for the mobile app. You can find the Appium test suites in the TestSuites folder. However, due to time constraints, I couldn't automate everything, but I am confident in my ability to automate effectively using Robot Framework, which is my key skillset.
