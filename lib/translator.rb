require 'yaml'
require 'pry'# require modules here

def load_library(path)
    emoticon_lib=YAML.load_file(path)
    new_hash={}
    emoticon_lib.each do |key,value|
      eng=value[0]
      jpn=value[1]
      new_hash[key]={}
      new_hash[key][:english]=eng
      new_hash[key][:japanese]=jpn
  end
 new_hash
end

def get_english_meaning(path,emoticon)
    load_library(path).each do |key,value|
   english=value[:english]
   japanese=value[:japanese]
   if emoticon==japanese
     return key
   end
  end
  return "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(path,emoticon)
    load_library(path).each do |key,value|
   english=value[:english]
   japanese=value[:japanese]
   if emoticon==english
     return japanese
   end
  end
  return "Sorry, that emoticon was not found"
end
