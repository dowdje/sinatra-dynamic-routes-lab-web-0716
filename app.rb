require_relative 'config/environment'

class App < Sinatra::Base

  get '/'  do
    "Welcome to some bullshit"
  end

  get '/reversename/:name' do
    name = params[:name]
    "#{name.reverse}"
  end

  get '/square/:number' do
    square = params[:number].to_i**2
    "#{square}"
  end

  get '/say/:number/:phrase' do
    num = params[:number].to_i
    phrase = params[:phrase]
    "#{phrase}\n"*num
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
  
   params.collect do |key, value|
    if key.include?("word")
      value
    end
   end.join(" ") + "."
  end

  get '/:operation/:number1/:number2' do
    if params[:operation] == "add"
      operation = "+"
    elsif params[:operation] == "subtract"
      operation = "-"
    elsif params[:operation] == "multiply"
      operation = "*"
    end

      num2 = params[:number2].to_i
      num1 = params[:number1].to_i
      answer = num2.send(operation, num1)
      "#{answer}"
    end


end