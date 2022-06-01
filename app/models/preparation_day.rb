class PreparationDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~2日で発送' },
    { id: 3, name: '2~3日で発送' },
    { id: 4, name: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end

# 発送までの日数は、「---、1\~2日で発送、2\~3日で発送、4~7日で発送」の4項目が表示されること
