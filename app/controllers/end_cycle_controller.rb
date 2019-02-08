class EndCycleController < ApplicationController
	protect_from_forgery with: :null_session

  def export
 
  @cards =  EndCycle.all
  respond_to do |format|
    format.html
    format.csv { send_data @cards.to_csv }
  end
   
 end
  	
  def import_endcycle
    uploaded_csv = params[:file]
    csv_text = File.read(uploaded_csv.path)
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'windows-1251:utf-8')
  #csv = CSV.parse(csv_text, :headers => true, :encoding =>'iso-8859-1:utf-8')
  
    csv.each do |row|
      row_hash = row.to_hash
      #d = Card.where("title LIKE ?", row_hash["Title"])
      d = Card.where("title LIKE ?", row_hash["title"])
      
      d1 = d.first
      d1.lit_lead = row_hash["lit_contact"]
      d1.service_lead = row_hash["pstakeholder"]
      d1.save! 
      #:card_id :domain :enthusiasm :knowledge :resource 
      row_hash.delete "title"
      row_hash.delete "lit_contact"
      row_hash.delete "pstakeholder"
      
      
      row_hash.merge!(card_id: d1.id)
      row_hash.merge!(cycle: params[:cycle])

      row_hash.delete_if { |k, v| v.nil? }
      
      
      s =  EndCycle.new (row_hash)
      s.save!
      
    end  
  end
end
