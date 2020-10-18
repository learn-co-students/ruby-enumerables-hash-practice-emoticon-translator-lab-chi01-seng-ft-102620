# require modules here
require 'pry'
require 'yaml'
def load_library(emoticon_file)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  emoticon_final = {}
  emoticons.each do |meaning, value|
    emoticon_final[meaning]={english: value[0], japanese: value[1]}
  end
  p emoticon_final
end

def get_japanese_emoticon(emoticon_file, emoticon)
  # code goes here
  emoticon_load = load_library(emoticon_file)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  emoticon_mean = {'get_meaning'  => {},
                  'get_emoticon' => {} }

  emoticons.each do |meaning, value|
    english = value[0]
    japanese = value[1]
    emoticon_mean['get_meaning'][japanese] = meaning
    emoticon_mean['get_emoticon'][english] = japanese
  end
  japanese_emoticon = emoticon_mean['get_emoticon'][emoticon]
  japanese_emoticon ? japanese_emoticon : 'Sorry, that emoticon was not found'
end

def get_english_meaning(emoticon_file, emoticon)
  emoticons_load = load_library(emoticon_file)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  emoticon_mean = {'get_meaning'  => {},
                  'get_emoticon' => {} }

  emoticons.each do |meaning, value|
    english = value[0]
    japanese = value[1]
    emoticon_mean['get_meaning'][japanese] = meaning
    emoticon_mean['get_emoticon'][english] = japanese
  end
  english_meaning = emoticon_mean['get_meaning'][emoticon]
  english_meaning ? english_meaning : 'Sorry, that emoticon was not found'
end