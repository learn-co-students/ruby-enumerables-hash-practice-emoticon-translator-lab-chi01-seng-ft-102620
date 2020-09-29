require "yaml"
require 'pry'

# require modules here

def load_library(file_path)
  new_hash ={}
  library = YAML.load_file('./lib/emoticons.yml')
  library.each do |key, value|
  new_hash[key]= {}
  new_hash[key][:english] = value[0]
  new_hash[key][:japanese] = value[1]
  end
new_hash
end



def get_japanese_emoticon(file_path,emoticon)
    library = load_library(file_path)
     library.each do  |key, value|
       if emoticon == value[:english]
         return value[:japanese]
      end
  end
  return "Sorry, that emoticon was not found"
end
  


def get_english_meaning(file_path,emoticon)
 library = load_library(file_path)
 library.each do  |key, value|
   if emoticon == value[:japanese]
     return key
    end
  end
 return "Sorry, that emoticon was not found"
end
