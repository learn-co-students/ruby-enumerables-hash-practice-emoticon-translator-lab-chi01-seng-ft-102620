require 'yaml'
require 'pry'


def load_library(filepath)
  emoticons = YAML.load_file(filepath)
  solution = emoticons.each_with_object({}) do |(key , value) , hash|
    hash["#{key}"] = {english: value[0], japanese: value[1]}
    #binding.pry
  end
end

def get_japanese_emoticon(filepath, emoticon)
  emoticons = load_library(filepath)
  result = emoticons.find{|key , value| value[:english] == emoticon}
  #binding.pry
  return result.nil? ?  "Sorry, that emoticon was not found" : result[1][:japanese]
end

def get_english_meaning(filepath, emoticon)
  emoticons = load_library(filepath)
  result = emoticons.find{|key , value| value[:japanese] == emoticon}
  #binding.pry
  return result.nil? ?  "Sorry, that emoticon was not found" : result[0]
end