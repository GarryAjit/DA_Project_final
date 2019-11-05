import os
f1 = open('res.txt','a')
files = os.listdir("D:/Netflix_data/training_set")
for i in files:
	f = open("D:/Netflix_data/training_set/"+i,"r")

	for line in f:
		if ':' in line:
			mid = line.replace(':','')
			mid = mid.replace('\n','')
		else:
			s = line.split(',')
			s.pop()
			uid = s[0]
			rating = s[1]
			print(mid+','+uid+","+rating+'\n')
			f1.write(uid+','+mid+","+rating+'\n')
	




