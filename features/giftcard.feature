Feature: Gift Card Module

 Background:
    Given User is on home page and select city "Berhampur"
    
  @GiftCardNavigation
  Scenario: Navigate to the Gift Card section and validate Check Gift Card Balance icon
    When User navigate to the "Gift Card" section
    Then User should see the "Check Gift Card Balance" icon displayed

  @GiftCardInvalidVoucher
  Scenario: Validate error message for invalid gift card voucher
    When User navigate to the "Gift Card" section
    When User click on the "Check Gift Card Balance" icon
    And User enter an invalid voucher code "63708ABCD"
    And User click on the "Check Balance" button
    Then User should see an error message "Please verify input"
