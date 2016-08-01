x = input('Please input an integer of more than 3 digits:')
try:
	x = int(x)
	x = x // (100)
	if x == 0:
		print('You must input an integer of more than 3 digits.')
	else:
		print(x)
except BaseException:
	print('You must input an integer.')



#编写程序,生成包含1000个0到100之间的随机整数,并统计每个元素的出现次数
#可以用集合来实现该功能
import random
x = [random.randint(0,100) for i in range(1000)]
d = set(x)
for v in d:
	print(v,':',x.count(v))
	pass

print(2 in [1,2,3,4])

d = {1:'a',2:'b',3:'c',4:'d'}
v = input('Please input a key:')
v = eval(v)
print(d.get(v,'你输入的键不存在'))


print(dir(__builtins__))