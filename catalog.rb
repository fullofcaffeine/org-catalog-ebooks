require 'fileutils'
require 'pathname'
require 'debugger'


#TODO Recursive file globbing
#TODO Elisp, check if entry already exists
#TODO Specific format in the name of the file, as in <title (tags)>.pdf
#TODO Reindex

ARCHIVE_BOOKS_DIR = "/Users/fullofcaffeine/archive_books"
DESTINATION_DIR   = "/Volumes/LaCie/ebooks"

catalog = true if ARGV[0] == 'catalog'

unless Dir.exists?(DESTINATION_DIR)
  puts 'Error: Connect your HD'
  return
end

list_of_files = []

orig_dir,dest_dir = (if !catalog
                       [ARCHIVE_BOOKS_DIR,DESTINATION_DIR]
                      else
                       [DESTINATION_DIR,DESTINATION_DIR]
                     end)
  

Dir.glob(File.join(orig_dir,"*")) do |file|
 filename = Pathname.new(file).basename
 FileUtils.mv(file,File.join(DESTINATION_DIR,filename)) if !catalog
 list_of_files << {:file => filename.to_s, :path => File.join(dest_dir,filename)}
end


#mocked up for testing purposes
#files_moved = [{:file => 'temp.pdf',:path => "/Volumes/LaCiE/Learning/Books/temp.pdf"},
               #{:file => 'temp.pdf',:path => "/Volumes/LaCiE/Learning/Books/temp.pdf"},
               #{:file => 'temp.pdf',:path => "/Volumes/LaCiE/Learning/Books/temp.pdf"},
               #{:file => 'temp.pdf',:path => "/Volumes/LaCiE/Learning/Books/temp.pdf"},
               #{:file => 'temp.pdf',:path => "/Volumes/LaCiE/Learning/Books/temp.pdf"},
               #{:file => 'temp.pdf',:path => "/Volumes/LaCiE/Learning/Books/temp.pdfr"}]

puts list_of_files.to_s




