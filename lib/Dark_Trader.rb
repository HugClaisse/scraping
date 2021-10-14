require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto_scrapper
    page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
    puts page.class # => utilisation de la gem nokogiri:sur le site des cryptos

    name_currency = page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]').find_all  
    name_currency_array = name_currency.collect(&:text)
    price_currency = page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[5]").find_all
    price_currency_array = price_currency.collect(&:text)
    price_currency_array.map!{|number| number.delete("$").to_f}
    final_hash = Hash[name_currency_array.zip(price_currency_array)]
    
    Hash.class_eval do
        def split_into(divisions)
            count = 0
            inject([]) do |final, key_value|
                final[count%divisions] ||= {}
                final[count%divisions].merge!({key_value[0] => key_value[1]})
                count += 1
                final
            end
        end
     end
     puts final_hash.split_into(name_currency_array.size)   
    end

    crypto_scrapper


