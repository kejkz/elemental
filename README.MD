# Elemental

## Introduction

Elemental gem is a simple wrapper around [Capybara](https://github.com/teamcapybara/capybara) 
that gives you a straight-forward way to work with web page elements. 
Its main purpose is to make using page elements sharing easier between different tests and 
test suites, because feature tests can be quite complex and use an arrays of
combinations of html accessors to drive to the proper test coverage. This gem just streamlines 
that task and gives you a way to define and reuse html elements. And you can add a method 
or two if you need to.

## Installation

Just add elemental to your test section in bundle:

`gem elemental`

## Usage

Just create a new object for your elements and start testing. 

```ruby

class MyElements < Elemental
  button :my_button1, '.my-button-class', text: 'My Button', match: :first
  field :my_field1, '#my_field'
  link :my_link1, '#my_link1', text: 'Some Text'
  element :my_element, '.my-selector'
  elements :my_shiny_elements, '.my-shiny-selector-2'
end
```

This gives you two new methods for each of these selectors:

```ruby
my_elements = MyElements.new
my_elements.my_button1 # => 'My Button'
my_elements.my_button1_element # => Capybara::Node
```

Methods for creating an element take a name of the element as first parameter, 
and locator as second. You can also pass Capybara parameters as you would do in 
a test.

You can freely combine different element classes to create a complex object by 
using Ruby classes.

```ruby

class MyComplexPage < Elemental
  def my_elements
    @my_element ||= MyElements.new
  end
end
```
