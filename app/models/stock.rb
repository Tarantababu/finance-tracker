class Stock < ApplicationRecord
    
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(publishable_token: 'Tpk_65bd2845db21490f811d4c3954b1d909', 
        secret_token: 'Tsk_b885090e002b4365b25638057a2fd002',
        endpoint: 'https://sandbox.iexapis.com/v1')
        
        new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price:  client.price(ticker_symbol))
    end
end
