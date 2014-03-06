require 'sinatra'
require 'json'
require 'csv'
require 'mysql'

def db(db, host, username, password, socket)
  mysql = Mysql.init()
  mysql.connect(host, username, password, db, 3306, socket)
  mysql
end

def leads_from_database(page_id)
  my = db('lp_webapp', 'localhost', 'root', 'password', '/var/run/mysqld/mysqld.sock')

  leads = []
  my.query("SELECT * from form_submissions where page_uuid = '#{page_id}'") do |result|
    result.each_hash { |row| leads << row }
  end

  leads
end

def leads_headers(leads)
  header_mess = leads.collect { |lead| lead.keys }.flatten.uniq
  ['page_uuid', 'date_submitted', 'time_submitted', 'variant', 'ip_address'].concat(header_mess).uniq
end

def lead_data_in_order(headers, lead)
  lead.values_at(*headers)
end

def leads_as_csv_arrays(leads)
  headers = leads_headers(leads)
  leads_with_data_ordered = leads.collect { |lead| lead_data_in_order(headers, lead) }

  [headers, *leads_with_data_ordered]
end

def page_leads_as_csv(page_id)
  leads = leads_from_database(page_id)
  csv_data = leads_as_csv_arrays(leads)
  CSV.generate do |csv|
    csv_data.each { |row| csv << row }
  end
end

get '/page/:page_id' do
  content_type 'text/csv'
  page_leads_as_csv(params[:page_id])
end
