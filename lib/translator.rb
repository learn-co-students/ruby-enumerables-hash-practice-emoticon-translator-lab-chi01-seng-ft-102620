# require modules here
require 'pry'
require "yaml"

def load_library(file_path)
  
  emoticons_file = YAML.load_file(file_path)  

  emoticon_lib = {}

  emoticons_file.each do |key, value|
  emoticon_lib[key] = {:english => value[0], :japanese => value[1]}  
  
  end

  # puts emoticon_lib

  emoticon_lib
 
end



def get_japanese_emoticon(file_path_two, english_emoticon)
  library = load_library(file_path_two)
  var_response = nil 
  
  library.each do |emotion, name|
    
    name.each do |language, drawing|
      
      if drawing == english_emoticon
        
        return library[emotion][:japanese]
        
      end
    end
  end
  
  if var_response == nil
    
    return "Sorry, that emoticon was not found"
    
  end
  
  
  # code goes here
end



def get_english_meaning(file_path, japanese_emoticon) 
  library = load_library(file_path)
  var_response = nil 
  
  library.each do |emotion, name|
    name.each do |language, drawing|
      
      if drawing == japanese_emoticon
        
        return emotion
        
      end
    end
  end
  
  if var_response == nil
    return "Sorry, that emoticon was not found"
    
  end
    
  
  # code goes here
end