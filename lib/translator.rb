require "yaml"
require "pry"

def load_library(filepath)
  emoticons = YAML.load_file(filepath)
  result = emoticons.each_with_object({}) do |(key, value), hash|
    hash["#{key}"] = {english: value[0], japanese: value[1]}
  end
end

def get_japanese_emoticon(filepath, emoticon)
  emoticons = load_library(filepath)
  res = emoticons.find{|key,value| value[:english] == emoticon}
  return res.nil? ? "Sorry, that emoticon was not found" : res[1][:japanese]
end

def get_english_meaning(filepath, emoticon)
  emoticons = load_library(filepath)
  res = emoticons.find{|key,value| value[:japanese] == emoticon}
  return res.nil? ? "Sorry, that emoticon was not found" : res[0]
end