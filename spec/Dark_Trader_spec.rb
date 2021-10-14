require_relative '../lib/Dark_Trader'

#test de l'app du trader fou

describe "the Dark_Trader" do
    it "give the name of the currency" do
        #trouve le nom de la crypto
        expect(name_currency)).to eq("BTC")
        expect(name_currency)).to eq("BNB")

    end
end
end