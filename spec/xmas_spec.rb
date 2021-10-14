require_relative '../lib/xmas'

describe "get_townhall_email" do
  it 'give me the email of the city' do
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/auvers-sur-oise.html")).to eq("communication@auvers-sur-oise.com")
  end
end
