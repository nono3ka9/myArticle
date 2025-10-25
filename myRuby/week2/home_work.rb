me = { name: "Noa", age: 17, hobby: "ドラマ鑑賞" , sns: "nono_320_"}
friend1 = { name: "Hirohito", age: 17, hobby: "プログラミング", sns: "gadget_love"}
friend2 = { name: "Shuntaro", age: 18, hobby: "デザイン", sns: "mizuiro0835" }

people = [me, friend1, friend2]

# 2. introduce(person) メソッドを作る
def introduce(person)
  # 3. 紹介文の形式を作成
  "こんにちは、" + person[:name] + "です。年齢は" + person[:age].to_s + "歳、趣味は" + person[:hobby] + "です。"
end

# 4. 配列を each で回して紹介文を表示
people.each do |person|
  puts introduce(person)
end
