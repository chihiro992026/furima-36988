class ShippingCost < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '支払い（購入者負担）' },
    { id: 3, name: '送料込み（支払者負担' },
  ]
  include ActiveHash::Associations
    has_many :products         
  end