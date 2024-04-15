
# Credit Card Processing

An implementation of the credit cards processing written in Ruby and using RSpec for testing. This explains how to maintain an account balance while processing credit card transactions.


## Overview
  ```
  - Gemfile  
  - lib
        - card.rb                    'Contains the Credit Card Class'
        - card_processor.rb          'Holds the Payment Processing and Reporting Class'
        - run_credit_card_process.rb 'This is the script for running the card process'
  - README.md  
  - spec  
        - card_processor_spec.rb     'Card tests'
        - input_1.txt                'Test Input File 1'
  ```

## Design

This repository uses 2 classes to handle validating credit cards and process cards for balances. The general control flow is:

    run_credit_card_process (Input Mode: STDIN or single-file)
        
        - Add     
        - Charge  
        - Credit 

## Class and File Overview

##### run_credit_card_process

- This is a simple STDIN/file driver that determines input. It expects either single file name or bunch of multiple input lines 

##### CardProcessor
        
- This class maintains all cards and performs the summary output report at the end of processing. It is the driving interface for the Add, Charge, and Credit commands.

##### Card

- This class maintains the person name, card number, luhn10 check, card balance and card limits


## Assumptions:

This build was tested with Ruby 2.6.3p62 installed:

``` 
$ ruby -v
ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-darwin18]
```


## Installation

  git clone URL

  Install the gems with: bundle install

  Run the tests with: bundle exec rspec

  Run this file run_card_process.rb found in the lib directory: 

    ```
      How to run Card Processing

          To run in interactive mode use this command:
              credit_card_processing/lib$ ruby run_credit_card_process.rb < ../spec/input1.txt        

          To run the transactions listed inside a file use this command:
              credit_card_processing/lib$ ruby run_credit_card_process.rb ../spec/input1.txt        

    ```

