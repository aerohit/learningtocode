require './printable_document.rb'

describe PrintableDocument do
  before :each do
    @text = 'A bunch of words'
    @doc  = PrintableDocument.new('test', 'nobody', @text)
  end

  it 'should know how to print itself' do
    stub_printer = double(:available? => true, :render => nil)
    @doc.print(stub_printer).should == 'Done'
  end

  it 'should return the proper string if printer is offline' do
    stub_printer = double(:available? => false, :render => nil)
    @doc.print(stub_printer).should == 'Printer unavailable'
  end
end
