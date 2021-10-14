require 'bundler'
Bundler.require
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'httparty'
require 'byebug'

# mail mairie des Avernes

def get_townhall_email(url)
  doc = Nokogiri::HTML(URI.open(url))
  email = doc.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  return email
end

# puts get_townhall_email("http://annuaire-des-mairies.com/95/avernes.html")

# liste des emails des mairie du 95


page_list = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))

list = page_list.xpath('//*[@class="lientxt"]')
#list_href = page_list.xpath('//a[@class="lientxt"]/@href ')
#list_name = page_list.xpath('//a[@class="lientxt"] ').text


array_city_contact = []
url_begin = "http://annuaire-des-mairies.com"

list.each do |city|
  city_contact = {}
  # city.content # => donne le nom de chaque ville issue de la page list des villes
  city_link = city['href'] # => donne la partie de l'URL correspondant à la ville
  city_url = url_begin + city_link[1..-1]

  page_city = Nokogiri::HTML(URI.open(city_url))
  city_email = page_city.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  city_contact[city.content.downcase] = city_email
  array_city_contact << city_contact

  puts array_city_contact

end



