require "mynewsdesk"

describe MynewsdeskType, "API" do
  
  before(:all) do 
    class DemoType < MynewsdeskType;end
  end

  it "should match type of media with subclasses" do
    item = MynewsdeskType.from "<item><type_of_media>demo_type</type_of_media></item>"
    item.class.should == DemoType
  end
  
  it "should use the default subclass when no types match" do
    item = MynewsdeskType.from "<item><type_of_media>unknown</type_of_media></item>"
    item.class.should == Default
  end
  
  it "should fetch data from API" do
    items = MynewsdeskAPI.fetch
    items.size.should == 16
  end
  
end

describe MynewsdeskType, "subclasses & instances" do
  before(:all) do
    class DemoItem < MynewsdeskType;end
  end
  
  before(:each) do
    data = {"node" => "value", "second" => "val"}
    @demo = DemoItem.new(data)
  end
  
  it "should know its template name" do
    DemoItem.model_name[:partial_path].should == "demo_item"
    # This will make it possible to render the class like a partial.
  end
  
  it "should access data" do
    @demo["node"].should == "value"
  end
  
  it "should be possible to loop trugh all fields" do
    count = 0
    @demo.fields do |key, value|
      count += 1
    end
    count.should == 2
  end
  
end
