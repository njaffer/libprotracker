class StrategicSortingController < ApplicationController
  protect_from_forgery with: :null_session

  def import_ss

  end
  	
  def import_ss_data
    uploaded_csv = params[:file]
    csv_text = File.read(uploaded_csv.path)
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'windows-1251:utf-8')
  #csv = CSV.parse(csv_text, :headers => true, :encoding =>'iso-8859-1:utf-8')
  
    csv.each do |row|
      row_hash = row.to_hash
      #d = Card.where("title LIKE ?", row_hash["Title"])
      d = Card.where("title LIKE ?", row_hash["title"])

      #:card_id :domain :enthusiasm :knowledge :resource 
      row_hash.delete "title"
      
      row_hash.merge!(card_id: d.first.id)
      row_hash.delete_if { |k, v| v.nil? }
      
      s =  StrategicSorting.new (row_hash)
      s.save!
      
    end  
  end
end
