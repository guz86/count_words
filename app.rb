# write a quick and dirty program to produce a count of all the different words in a text file. Use any definition of word that makes logical sense or makes youe job easy. 

# 1. открываем файл с текстом
f = File.open('1.txt', 'r')

# 3. создаем пустой хэш слово - количество
@hh ={}

# 4. метод принимет слово, переводит в нижний регистр и считает сколько раз оно добавлялось и заносит данные в хэш
def add_to_hash word
  # если слово не пустое
  if !word.empty?
    word.downcase!
    cnt = @hh[word].to_i
    cnt += 1
    @hh[word] = cnt
  end
end

# 2. каждую линию разбиваем на массив и выполняем ф-ю для каждого элемента массива
f.each_line do |line|
  arr = line.split(/\s|\n|\.|,|"/)
  arr.each { |word| add_to_hash(word)}
end

# 5. закрываем файл
f.close


# 6. сортируем число слов и слова в хэше и выводим их в разном порядке
@hh = @hh.sort_by {|_key, value| value}
#@hh = @hh.sort_by {|_key, value| value}.reverse
@hh.each do |key,value|
  puts "#{value}, #{key}"
end