@DIDComm-V2 @WACI
Feature: WACI Issuance

  @DIDExchangeConnection
  Scenario: WACI issuance flow
    Given "2" agents
      | name | role   |
      | Acme | issuer |
      | Bob  | holder |
    And "Acme" is ready to issue a credential using WACI
    And "Acme" is running with parameters "{"mime-type":["didcomm/v2"]}"
    And "Bob" is running with parameters "{"mime-type":["didcomm/v2"]}"
    When "Acme" creates a didcomm v2 invitation
    And "Bob" accepts the didcomm v2 invitation from "Acme"
    When "Bob" uses WACI to propose a credential to "Acme"
    And "Acme" has received a didcomm v2 message from "Bob" and created a connection
    Then "Acme" validates the proposal
    Then "Acme" sends a Credential Manifest along with a Credential Fulfillment preview
    Then "Bob" sends a Credential Application
    Then "Acme" validates the Credential Application
    Then "Acme" sends a Credential Fulfillment
    Then "Bob" accepts the Credential Fulfillment
