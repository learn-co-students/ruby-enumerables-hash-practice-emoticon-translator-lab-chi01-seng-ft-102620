# require modules here
require 'pry'
require "yaml"

def load_library(file)
  file = YAML.load_file('lib/emoticons.yml')
  library = Hash.new
  file.each do |key, value|
    library[key] = {}
    library[key][:english] = value[0]
    library[key][:japanese] = value[1]
  end
  library
end

def get_english_meaning(file, jap_emoji)
  hoh = load_library(file)
  jap_emoji = hoh.keys.find do |key|
    hoh[key][:japanese] == jap_emoji
  end
  jap_emoji ? jap_emoji : "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(file, eng_emoji)
  hoh = load_library(file)
  eng_emoji = hoh.keys.find do |key|
    hoh[key][:english] == eng_emoji
  end
  eng_emoji ? hoh[eng_emoji][:japanese] : "Sorry, that emoticon was not found"
end
