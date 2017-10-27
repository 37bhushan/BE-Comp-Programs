#Input Data -
#If Json requied then json.load is to be used along with empty data[[,,,]] object
data=[['consultancy','M','PhD','M'],                   
      ['service','L','Mtech','L'],
      ['research','L','Mtech','L'],
      ['service','L','Btech','M'],
      ['consultancy','M','Mtech','H'],
      ['research','M','PhD','M'],
      ['research','L','Btech','M'],
      ['service','M','Mtech','M'],
      ['consultancy','H','Btech','H'],
      ['research','M','PhD','M']]

# raw_input takes unformatted strings only, type casting is required or input is to be used when defined inputs are there
print("Enter Qualification, Age and Experience -")
desiredQualification = raw_input("Enter Desired Qualification- ")
inputAge = input("Enter Desired Age- ")
inputExperience = input("Enter Desired Experience- ")


#Creating Age Groups
if inputAge < 30:
	desiredAge = 'L'
elif inputAge >= 30 and inputAge < 40:
	desiredAge = 'M'
elif inputAge >40:
	desiredAge ='H'

#Creating Experience Groups

if inputExperience < 5:
	desiredExperience = 'L'
elif inputExperience >=5 and inputExperience < 10:
	desiredExperience = 'M'
elif inputExperience >10:
	desiredExperience = 'H'


#Total for each worktype
consultancyCount = 0
serviceCount = 0
researchCount = 0

for i in range(len(data)):
	if 'consultancy' == data[i][0]:
		consultancyCount= consultancyCount + 1
	if 'service' == data[i][0]:
		serviceCount = serviceCount + 1
	if 'research' == data[i][0]:
		researchCount = researchCount + 1


#Calculating Worktype Probabilites

consultancyProb = float(consultancyCount) / len(data)
serviceProb = float(serviceCount) / len(data)
researchProb = float(researchCount)/ len(data)

print("\nWorktype Probablities-")
print("Concultancy ",consultancyProb)
print("Service ",serviceProb)
print("Research ", researchProb)


#Age and Worktype Prob
ConsAndAge = 0 
SerAndAge = 0
ResAndAge = 0

#Qualification and Worktype Prob
ConsAndQuali = 0
SerAndQuali = 0
ResAndQuali = 0

#Experience and Worktype Prob
ConsAndExp = 0
SerAndExp = 0
ResAndExp = 0


#Calculating Totals
for i in range(len(data)):
	if 'consultancy' == data[i][0]:
		if desiredAge == data[i][1]:
			ConsAndAge = ConsAndAge + 1
		if desiredQualification == data[i][2]:
			ConsAndQuali = ConsAndQuali + 1
		if desiredExperience == data[i][3]:
			ConsAndExp = ConsAndExp + 1
	elif 'service' == data[i][0]:
		if desiredAge == data[i][1]:
			SerAndAge = SerAndAge + 1
		if desiredQualification == data[i][2]:
			SerAndQuali = SerAndQuali + 1
		if desiredExperience == data[i][3]:
			SerAndExp = SerAndExp + 1
	elif 'research' == data[i][0]:
		if desiredAge == data[i][1]:
			ResAndAge = ResAndAge + 1
		if desiredQualification == data[i][2]:
			ResAndQuali = ResAndQuali + 1
		if desiredExperience == data[i][3]:
			ResAndExp = ResAndExp + 1

#Calculating Probabilities
#Age/Worktype
consAndAgeProb =float(ConsAndAge)/consultancyCount
serAndAgeProb = float(SerAndAge)/serviceCount
resAndAgeProb = float(ResAndAge)/researchCount


print("\nAge/Worktype Probablities-")
print("Age/Concultancy ",consAndAgeProb)
print("Age/Service ",serAndAgeProb)
print("Age/Research ", resAndAgeProb)

print 'debug'
print SerAndExp
print ResAndExp

#Qualification/Worktype
consAndQualiProb = float(ConsAndQuali)/consultancyCount
serAndQualiProb = float(SerAndQuali)/serviceCount
resAndQualiProb = float(ResAndQuali)/researchCount


print("\nQualification/Worktype Probablities-")
print("Qualification/Concultancy ",consAndQualiProb)
print("Qualification/Service ",serAndQualiProb)
print("Qualification/Research ", resAndQualiProb)


#Experience/Worktype
consAndExpProb = float(ConsAndExp)/consultancyCount
serAndExpProb = float(SerAndExp)/serviceCount
resAndExpProb =float(ResAndExp)/researchCount


print("\nExperience/Worktype Probablities-")
print("Experience/Concultancy ",consAndExpProb)
print("Experience/Service ",serAndExpProb)
print("Experience/Research ", resAndExpProb)


#Total Probabilities
totalConsProb = consAndAgeProb * consAndQualiProb * consAndExpProb
totalSerProb = serAndAgeProb * serAndQualiProb * serAndExpProb
totalResProb = resAndAgeProb * resAndQualiProb * resAndExpProb

print("\nTotal Probablities-")
print("Total Concultancy ",totalConsProb)
print("Total Service ",totalSerProb)
print("Total Research ", totalResProb)

#Predictions
if totalConsProb  > totalSerProb  and totalConsProb > totalResProb  :
	print("Worktype is Consultancy")
elif totalSerProb > totalConsProb and totalSerProb > totalResProb :
	print("Worktype is Service")
elif totalResProb > totalConsProb and totalResProb > totalSerProb :
	print("Worktype is Research")




