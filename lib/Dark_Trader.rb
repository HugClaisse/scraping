require 'bundler'
Bundler.require
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'httparty'
require 'byebug'



url = "https://coinmarketcap.com/all/views/all/"
doc = Nokogiri::HTML(URI.open(url))
rows = doc.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr')

# //*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr xpath récup avec chrome

# affiche uniquement le nom de la crypto 

# doc.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[2]/div/a').each do |a|
#   print a.content
# end

# affiche un array de hash contenant en key les noms des crypto et leur valeur en value

array_crypto =[]
rows.collect do |row|
  crypto = {}
  crypto[row.xpath('td[2]/div/a').text] = row.xpath('td[5]/div/a').text.gsub('$', '').gsub(',', '').to_f
  array_crypto << crypto
end

puts array_crypto


