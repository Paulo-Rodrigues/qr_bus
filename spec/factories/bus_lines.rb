FactoryBot.define do
  factory :bus_line do
    from { "Bairro X" }
    to { "Bairro Y" }
    name { 'Linha 1' }
  end
end
