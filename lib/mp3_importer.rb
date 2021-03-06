require 'pry'
class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    self.files =  Dir.entries(@path).reject! do |file_name|
      file_name !~ /\.mp3$/
    end
  end

  def import
    self.files.each do |file_name|
      Song.new_by_filename(file_name)
    end
  end

end
