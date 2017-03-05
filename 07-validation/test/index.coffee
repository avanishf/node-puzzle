assert   = require 'assert'
{validate} = require '../lib'


describe '07-validation', ->

  it 'should return `true` for valid data', ->
    assert validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: name', ->
    assert !validate
      id: 1
      name: 2 # <--- problem
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'  
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: email', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar@baz.com' # <--- problem
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: id', ->
    assert !validate
      id: -5 # <--- problem
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: favouriteColour', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccffx' # <--- problem
      interests: ["cycling", "programming"]

  # !!!!!
  # Add more tests for different data that users might try to provide!
  # !!!!!
  
# 2 BROKEN TESTS FIX :
 it 'should return `true` for valid data: email', ->
    assert validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar@baz.com' # <--- not a  problem, reason explained below
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]
      
  #Reason : despite the email format is incorrect (i.e. duplicate '@') but as per the condition, email only accepts string with 
  #max. 255 charactes in length, so it should still accept the string 'foo@bar@baz.com'
  
   it 'should return `true` for valid data: favouriteColour', ->
    assert validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccffx' # <--- not a problem, reason explained below
      interests: ["cycling", "programming"]
      
  #Reason : despite the favouriteColour format is incorrect (i.e. extra invalid 'x' character) but as per the condition, 
  #favouriteColour only accepts string, so it should still accept '#ccccffx'
  
  #Edge Cases
  it 'should return `true` for valid data: name', ->
    assert validate
      id: 1 
      name: 'JohnDoeJohnDoeJohnDoeJohnDoeJohnDoeJohnDoeJohnDoeJohnDoeJohnDoe' # <-- 63 characters max
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ffcccc'
      interests: ["cycling", "programming"]
      
  it 'should return `true` for valid data: name', ->
    assert validate
      id: 1 
      name: '1' # <-- 1 characters min, as the field is "required"
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ffcccc'
      interests: ["cycling", "programming"]
    

  it 'should return `true` for valid data: interests', ->
    assert validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff' 
      interests: ["CyclingCyclingCyclingCycling123", "ReadingReadingReadingReading123",
                 "RunningRunningRunningRunning123","GymmingGymmingGymmingGymming123"] 
       #<-- max 31 characters per parameter with 4 input parameters
             
  it 'should return `true` for valid data: taxRate', ->
    assert validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 1   # <-- max value 1, alternatively we can test with minimum value 0
      favouriteColour: '#ccccff' 
      interests: ["cycling", "programming"]
  
  it 'should return `true` for valid data: email', ->
    assert validate
      id: 1
      name: 'John Doe'
      email: 'foobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmax123@mail.com'
      #<-- 255 charcters max
      taxRate: 0.1   
      favouriteColour: '#ccccff' 
      interests: ["cycling", "programming"]
  
  #Corner Cases
  it 'should return `true` for valid data: id, name, email, taxRate, favouriteColor, interests', ->
    assert validate
      id: 10000000000000000000000000000000000000000000000000000000
      name: 'JohnDoeJohnDoeJohnDoeJohnDoeJohnDoeJohnDoeJohnDoeJohnDoeJohnDoe'
      email: 'foobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmaxfoobarmax123@mail.com'
      taxRate: 1   
      favouriteColour: '#ccffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffcccc' 
      interests: ["CyclingCyclingCyclingCycling123", "ReadingReadingReadingReading123",
                 "RunningRunningRunningRunning123","GymmingGymmingGymmingGymming123"]
