class ExcelsController < ApplicationController
 def show
 end

 def create
   file = params[:file]
   workbook = RubyXL::Parser.parse file.path
   workbook[0].add_cell 0, 0, 'changed'
   send_data workbook.stream.string, type: file.content_type, filename: 'modified.xlsx'
 end
end
