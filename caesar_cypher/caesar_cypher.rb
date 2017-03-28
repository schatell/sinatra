require 'sinatra'
#require 'sinatra/reloader' if development?

cyphered = nil
to_be_cyphered = nil

get '/' do
  if params["to_cypher"] != nil
    to_be_cyphered = params["to_cypher"].to_s
    cyphered = cypher(params["to_cypher"], params["shift"].to_i)
  end
  erb :index ,:locals => {:to_be_cyphered => to_be_cyphered, :cyphered => cyphered}
end

def cypher(string, number)
  word = []
  string.scan(/./) do |i|
  if("A".."Z").include? (i.upcase)
    number.times {i = i.next}
    end
    word.push(i[-1])
  end
  word.join
end
 #test
