# FreeAgent Coding Challenge

Thank you for your interest in the FreeAgent Coding Challenge.  This template is a barebones guide to get you started.  Please add any gems, folders, files, etc. you see fit in order to produce a solution you're proud of.

## Coding Challenge Instructions

Please see the INSTRUCTIONS.md file for more information.

## Your Solution Setup and Run Instructions

Please include instructions on how to setup and run your solution here.

## Your Design Decisions

We'd love to hear your thoughts around any design decisions you made while coding your solution.

## My Solution

### OOP

The "elephant in the room" of solution, you might notice, is that I have not used an object oriented approach. And I understand that I can convert my modules, e.g. CurrencyExchangeRates into a class, however I have made a conscious decision not to. To justify this I would like to put forward my personal preference of a functional programming approach. In my opinion some mechanisms gain complexity, which can potentially grow to be harmful, from use of OOP. Considering the solution requirements, implementing a pure function with no side effects and clear inputs and output, I believe, functional approach is well suited here.

### Test driven approach

I have used TDD, or a close, more pragmatic approximation of it, to achieve goal. The implementation of the validation lend itself very well to this. The tests for validating the input were missing, so I thought the first step would be to add them, and then follow up with the implementation.

### Styling

As the code style was emphasised in the "What We Value" post, I have run the code through Rubocop to adhere to a common style. I used the default configuration which is close, if not the same as the style guide used by FreeAgent.

### Extending the Solution

The current implementation relies on the `Rates.get_rates_by_date` returning the data in a hash format, closely resembling the JSON data given. This is done as a quickest possible solution, trying to generalise it without prior knowledge of change of requirements might be trying to solve a problem that doesn't exist. However the function takes a `source_config` hash to empathize that the data source might be of a different type, e.g. `{db_name: 'foo', password: 'bar'}` for a database source. The responsibility of dealing with this is taken into the `Rates` module, and can potentially be extracted further.  An alternative could be substituting a different module to make use of polymorphic. It's important to highlight that `get_rates_by_date` returns data in the same hash format.

Depending on how the base currency rates are provided the returned hash from `Rates.get_rates_by_date` might have to be read into a hash of hashes, each top-level key representing the base currency for the data source. This will require changes to the calculation logic if a cross data source calculation is required. Again, this depends on the new data soures provided.
