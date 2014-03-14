
def parse_source_code(filename)
  path = File.dirname(__FILE__) + "/../fixtures/#{filename}"
  RubyParser.new.parse(File.read(path), path)
end
