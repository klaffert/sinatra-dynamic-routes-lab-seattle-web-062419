require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base
  
  # create a dynamic route that accepts a name
  # and renders the name backwards
  get '/reversename/:name' do
    params[:name].reverse
  end

  # create a dynamic route that accepts a number
  # and returns the square of that number
  get '/square/:number' do
   @squared = params[:number].to_i ** 2
   @squared.to_s
  end

  # create a dynamic route that accepts a number
  # and phrase and returns that phrase in a string
  # the number of times given
  get '/say/:number/:phrase' do
    result = ''

    params[:number].to_i.times do
      result += params[:phrase]
    end
    result
  end

  # create a dynamic route that accepts five words
  # and returns a string containing all five words
  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @w1 = params[:word1]
    @w2 = params[:word2]
    @w3 = params[:word3]
    @w4 = params[:word4]
    @w5 = params[:word5]
    "#{@w1} #{@w2} #{@w3} #{@w4} #{@w5}."   
  end

  # create a dynamic route that accepts an operation
  # (add, subtract, multiply, or divide) and performs
  # the operation on the two numbers provided
  get '/:operation/:number1/:number2' do
    number1 = params[:number1].to_i
    number2 = params[:number2].to_i

    answer = 'Unable to perform this operation'

    case params[:operation]
    when 'add'
      answer = (number1 + number2).to_s
    when 'subtract'
      answer = (number1 - number2).to_s
    when 'multiply'
      answer = (number1 * number2).to_s
    when 'divide'
      answer = (number1 / number2).to_s
    end
  end

end