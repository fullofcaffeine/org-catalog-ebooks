require 'fileutils'
require 'pathname'
require 'debugger'

ARCHIVE_BOOKS_DIR = "/Users/fullofcaffeine/archive_books"
DESTINATION_DIR   = "/Volumes/LaCie/Learning/Books"


unless Dir.exists?(DESTINATION_DIR)
  puts 'Error: Connect your HD'
  return
end

files_moved = []

Dir.glob(File.join(ARCHIVE_BOOKS_DIR,"*")) do |file|
 filename = Pathname.new(file).basename
 FileUtils.mv(file,File.join(DESTINATION_DIR,filename))
 files_moved << {:file => filename.to_s, :path => file}
end


#mocked up for testing purposes
#files_moved = [{:file => 'temp.pdf',:path => "/Volumes/LaCiE/Learning/Books/temp.pdf"},
               #{:file => 'temp.pdf',:path => "/Volumes/LaCiE/Learning/Books/temp.pdf"},
               #{:file => 'temp.pdf',:path => "/Volumes/LaCiE/Learning/Books/temp.pdf"},
               #{:file => 'temp.pdf',:path => "/Volumes/LaCiE/Learning/Books/temp.pdf"},
               #{:file => 'temp.pdf',:path => "/Volumes/LaCiE/Learning/Books/temp.pdf"},
               #{:file => 'temp.pdf',:path => "/Volumes/LaCiE/Learning/Books/temp.pdfr"}]

puts files_moved.to_s





