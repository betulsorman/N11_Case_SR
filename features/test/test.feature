Feature: N11 Case Test Suite

  Background:
    Given visit homepage

  Scenario Outline: Task1
    When clicks on <menu> under see_stores
    Examples:
      | menu |
      | best_sellers     |