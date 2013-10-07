require 'fileutils'
require 'quickbase_client'
require 'cgi'
require 'rexml/document'
include REXML

orig_tableDBID = "bgrhxym7s"
target_tableDBID = "bhesz6sig"
username = ""
password = ""
file_destination = File.dirname(__FILE__)

my_rids = []
my_types = []
my_descriptions = []
my_filenames = []
related_awarded_sites =[]

qbc = QuickBase::Client.new(username,password)
theRecordxml = "<xml>" + qbc.doQuery( orig_tableDBID, nil, "1000004", nil, nil, nil, nil, nil ).join + "</xml>"
# puts theRecordxml
doc = Document.new(theRecordxml)

doc.elements.each("xml/record/record_id_") do |ele|
	my_rids << ele.text
end

doc.elements.each("xml/record/attachment") do |ele|
	my_filenames << ele.text.gsub('#',"_")
end

doc.elements.each("xml/record/type") do |ele|
	my_types << ele.text
end

doc.elements.each("xml/record/description") do |ele|
	my_descriptions << ele.text
end

doc.elements.each("xml/record/related_awardedsite_recordid") do |ele|
	related_awarded_sites << ele.text
end

my_rids.each_index {|i|
filepath = file_destination + "/" + related_awarded_sites[i] + "/" + my_types[i]
FileUtils.mkdir_p (filepath)
qbc.downLoadFile( orig_tableDBID , my_rids[i], 6)
full_filepath = filepath + "\\" + my_filenames[i]
File.open( full_filepath, "wb") {|f|f.write(qbc.fileContents)}
# qbc.printRequestsAndResponses = true
# qbc.uploadFile( target_tableDBID, full_filepath, "Attachment", { "Related Awarded Unit" => related_awarded_sites[i] , "Type" => my_types[i], "Related Project" => "8", "Description" => my_descriptions[i] } )
}
