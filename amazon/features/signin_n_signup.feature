Feature: Sign In Amazon

@SignInWrong
Scenario: Sign In Registered Wrong Password
Given user click Sign in on main menu
Then user fill Sign In form with Registered email and Continue
Then user fill wrong Password and Sign In
Then Verify Alert Wrong Password


@SignInUnregistered
Scenario: Sign In Unregistered
Given user click Sign in on main menu 
When user fill Sign In form with Unregistered email and Continue
Then Verify Alert Cannot Find Account

@SignUpPositive
Scenario: Sign Up Available
Given user click Sign up on main menu and click create your Amazon account 
Then user fill Sign Up form
Then user Click Create Account

@SignUpNegative
Scenario: Sign Up Empty Field
Given user click Sign up on main menu and click create your Amazon account 
When user empty Sign Up form
Then user Click Create Account 
Then Verify Alert