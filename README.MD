# Elemental

## Introduction

Elemental gem is a simple wrapper around Capybara that gives you a 
straight-forward way to work with web page elements. It's main purpose 
is to make using page elements easier between different tests and 
test suites, because feature tests can be quite complex and use a different . 


## Installation

Just add elemental to your test section in bundle:

`gem elemental`

## Usage

Just create a new object for your elements and start testing. 

```ruby

class MyElements < Elemental
  button :my_button1, 'My Button'
  field :my_field1, '#my_field'
  link :my_link1, '#my_link1', text: 'Some Text'
end
```

Methods for creating an element take a name of the element as first parameter, 
and locator as second. You can also pass Capybara parameters as you would do in 
a test.

You can freely combine different element classes to create a complex object by 
using Ruby classes.

```ruby

class MyComplexPage
  def my_elements
    @my_element ||= MyElements.new
  end
end
```

## 
