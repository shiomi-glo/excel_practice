class ExcelsController < ApplicationController
 def show
 end

 def create
   file = params[:file]
   if file
    workbook = RubyXL::Parser.parse file.path
    workbook[0].add_cell 0, 0, 'changed'
    send_data workbook.stream.string, type: file.content_type, filename: 'modified.xlsx'
  else
    workbook = RubyXL::Workbook.new
    workbook[0].add_cell 0, 0, 'changed'
    send_data workbook.stream.string, type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", filename: 'modified.xlsx'
   end
 end
end
