require "open-uri"

class MynewsdeskAPI
  
  def self.fetch
    #url = "http://www.mynewsdesk.com/partner/api/1_0/#{MYNEWSDESK_API_KEY}/channel/all/material/test_list"
    url = "spec/fixtures/list.xml"
    doc = Nokogiri::XML(open(url))
    @list = doc.css("item").collect do |data|
      MynewsdeskType.from(data.to_xml)
    end
  end
  
end
  
class MynewsdeskType
  @@types = {}
    
  def self.inherited(subclass)
     @@types[subclass.to_s] = subclass
  end

  def self.model_name
    Struct.new(:partial_path).new(self.to_s.underscore)
  end
  
  def self.from(xml)
    data = Hash.from_xml(xml)["item"]
    name = data["type_of_media"].classify
    if @@types.has_key? name
      @@types[name].new(data)
    else
      Default.new(data)
    end
  end
  
  def initialize(data)
    @data = data
  end

  def [](key)
    @data[key]
  end
  
  def fields
    @data.each_pair do |key, value|
      yield key, value unless value.blank? 
    end
  end
    
end

class Default < MynewsdeskType
  # Should probably work a little to get this namespaced.
end
