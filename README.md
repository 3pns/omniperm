[![Circle CI](https://circleci.com/gh/3pns/omniperm.svg?style=svg)](https://circleci.com/gh/3pns/omniperm) 

# OmniPerm

## About

With Omniperm you can centralize your authorization strategies in a YAML file against a configurable context

## Install

Install for Ruby on Rails applications

```
rails g omniperm:install
```

## How to use

Manually authorize a method

```
def my_method
  service_authorized?
end
```

Authorize all methods of a class and its children

```
class MyService < Omniperm::AuthorizationRequired

  def do_something
  end

  def do_another_thing
  end
end

class MySubService < MyService

  def do_something
  end

  def do_another_thing
  end
end
```
