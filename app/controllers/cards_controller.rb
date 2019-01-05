class CardsController < ApplicationController
	protect_from_forgery with: :null_session

def import_cards
  uploaded_csv = params[:file]
  csv_text = File.read(uploaded_csv.path)
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'windows-1251:utf-8')
  csv.each do |row|
    
    row_hash = row.to_hash
    if (row_hash["Status"]=="Survey Preview")
    row_hash.delete "StartDate"
    row_hash.delete "EndDate"
    row_hash.delete "Status"
    row_hash.delete "IPAddress"
    row_hash.delete "Progress"
    row_hash.delete "Duration (in seconds)"
    row_hash.delete "Finished"
    row_hash.delete "ResponseId"
    row_hash.delete "RecipientLastName"
    row_hash.delete "RecipientFirstName"
    row_hash.delete "RecipientEmail"
    row_hash.delete "ExternalReference"
    row_hash.delete "LocationLatitude"
    row_hash.delete "LocationLongitude"
    row_hash.delete "DistributionChannel"
    row_hash.delete "UserLanguage"
    
    row_hash[:request_type] = row_hash.delete "Q1"
    row_hash[:requester_name] = row_hash.delete "Q22"
    row_hash[:requester_email] = row_hash.delete "Q24"
    row_hash[:requester_div] = row_hash.delete "Q23"

    if (row_hash[:request_type] == "Consultation")
      row_hash[:contact_names] = row_hash.delete "Q7"
      row_hash[:title] = row_hash.delete "Q2"
      row_hash[:short_description] = row_hash.delete "Q3"
      row_hash[:prev_work] = row_hash.delete "Q5"

    elsif (row_hash[:request_type] == "Service Improvement")
      row_hash[:contact_names] = row_hash.delete "Q31"
      row_hash[:title] = row_hash.delete "Q28"
      row_hash[:short_description] = row_hash.delete "Q29"
      row_hash[:prev_work] = row_hash.delete "Q30"
    
    
    elsif (row_hash[:request_type] == "New Service")
      row_hash[:contact_names] = row_hash.delete "Q27"
      row_hash[:title] = row_hash.delete "Q14"
      row_hash[:short_description] = row_hash.delete "Q15"
      row_hash[:prev_work] = row_hash.delete "Q16"

    else
      row_hash[:short_description] = row_hash.delete "Q17"
    end	
    
    byebug
    row_hash[:benefits] = row_hash.delete "Q13"
    row_hash[:goal_alignment] = row_hash.delete "Q8"
    row_hash[:at_stake] = row_hash.delete "Q9"
    row_hash[:ext_pressure] = row_hash.delete "Q10"
    row_hash[:non_tech] = row_hash.delete "Q11"
    row_hash[:priority] = row_hash.delete "Q12"
    #row_hash[:sponsor] = row_hash.delete "Q23"
    row_hash[:card_since] = row_hash.delete "RecordedDate"
    row_hash.delete_if { |k, v| v.nil? }

    byebug
    Card.create!(row_hash)    
  end	
end
end	



end
