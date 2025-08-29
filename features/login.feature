Feature: Login to BookMyShow
  The feature will validate login functionality with valid and invalid mobile numbers.

  Background:
    Given User is on home page and select city "Berhampur"

  @ValidLogin
  Scenario: Valid login with mobile and OTP
    When User is on Login Page
    And User enters mobile number "6370875497"
    And Clicks on Continue
    Then Verify Otp page 
    And back to login page
    And close popup

  @InvalidLogin
  Scenario: Invalid login with mobile
    When User is on Login Page
    And User enters mobile number "1234567890"
    Then Verify message "Invalid mobile number"
    And close popup

  @UIValidation
  Scenario: Verify all login UI elements are functional and visible
    When User is on Login Page
    Then Verify that mobile number field is visible
    And Verify that Continue button is not visible
    When User enters mobile number "1234567812"
    Then verify continue button is visible but should disable
    When User enters mobile number "8770762352"
    Then Verify continue button should enabled
    And close popup
