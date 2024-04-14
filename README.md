
# Credit Card Processing in Ruby

An implementation of the credit cards processing written in Ruby and using RSpec for testing. This explains how to maintain an account balance while processing credit card transactions.


## Overview
  ```
  - Gemfile  
  - Gemfile.lock  
  - lib
        - card.rb               'Contains the Credit Card Class'
        - card_processor.rb     'Holds the Payment Processing and Reporting Class'
        - run_card_processor.rb 'This is the script for running the card process'
  - README.md  
  - README
  - spec  
        - account_spec.rb   'Account tests'
        - card_spec.rb      'Card tests'
        - input_1.txt       'Test Input File 1'
        - input_2.txt       'Test Input File 2'
        - output_1.txt      'Test Output File 1'
        - output_2.txt      'Test Output File 2'
        - payment_processor_spec.rb 'Processing and simulation tests'
        - spec_helper.rb 
  - SPECS.md
  ```

## Design

This repository uses 2 classes to handle validating credit cards and updating account balances. The general control flow is:

    run_card_processor (Input Mode: STDIN or single-file)
        
        - Add     -> CardProcessor -> New Account
        - Charge  -> CardProcessor -> Charge Account
        - Credit  -> CardProcessor -> Credit Account

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
$
```

- The tests are written for usage with rspec. Due to the natue of the STDIN, I automated two tests in the spec/payment_processor_spec.rb that use shell scripting with the ruby 'system' method which uses a command that assumes the appropriate ruby is in the user's PATH and that /tmp/ is writeable and readable by the testing user.


## Installation

  Install the gems with: bundle install


 Run the tests with: bundle exec rspec


2. Display the usage help for the run_card_process.rb file found in the lib directory: 

    ```
    $ cd lib
    $ ruby run_processor.rb help
     
        Usage Help for Payment Processing

            To run in interactive mode use this command:
                ruby-luhn-checker-for-credit-card-validation/lib$ ruby run_processor.rb        

            To perform the transactions listed inside a file use this command:
                ruby-luhn-checker-for-credit-card-validation/lib$ ruby run_processor.rb <PATH TO INPUT FILE>

    $
    ```

## Validating Credit Cards

1. Get in the lib directory, run a single-file simulation with: 

    Usage: ``` ruby run_card_process.rb <PATH TO INPUT FILE> ```

    ##### Example of single-file execution mode:

    ```
    $ ruby run_card_process.rb ../spec/input_1.txt 
    Greg: $500
    Hank: error
    Karla: $-93
    $
    ```

    ```
    $ ruby run_card_process.rb ../spec/input_2.txt 
    !@#IKCVXZCD()ANFEKo@N!or321$#: error
    -nmcnxzianieADFSACxczvm: $807
    Blanka: $0
    Calvin: $0
    Greg: error
    Hank: error
    He-man: $0
    HeyAbbott: $0
    Hobbes: $0
    Jimbo: $0
    Karla: error
    Liono: $0
    Mumra: $0
    PaulyShore: error
    Punchy: $0
    Sheera: $0
    Storm: $0
    TankAbbott: error
    ben: $0
    bob: $-999
    charlie: $6
    dan: $0
    dee: $7
    frank: $8
    fred: error
    jay: $999
    lkasjadlfkajASJFKDLSJAFKSDAJ: $500
    mac: $5
    $
    ```

1. Run in interactive mode with: 

    ``` ruby run_card_process.rb ```

    Example:

    ```
    $ ruby run_processor.rb 
    Add Greg 4111111111111111 $1000
    Add Karla 5454545454545454 $3000
    Add Hank 1234567890123456 $2000
    Charge Greg $500
    Charge Greg $800
    Charge Karla $7
    Credit Karla $100
    Credit Hank $200

    Greg: $500
    Hank: error
    Karla: $-93
    $
    ```

