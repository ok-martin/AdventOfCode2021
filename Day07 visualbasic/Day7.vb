Public Module Program
	Public Sub Main(args() As String)
    Dim input As String = "1101,1,29,67,1102,0,1,65,1008,65,35,66,1005,66,28,1,67,65,20,4,0,1001,65,1,65,1106,0,8,99,35,67,101,99,105,32,110,39,101,115,116,32,112,97,115,32,117,110,101,32,105,110,116,99,111,100,101,32,112,114,111,103,114,97,109,10,1304,510,261,432,1,767,525,1663,1598,125,84,924,216,1049,365,4,21,226,131,178,666,1134,58,839,1065,670,419,11,297,28,80,258,811,659,1288,21,17,436,1184,823,667,7,499,249,406,157,112,715,220,93,710,148,152,1192,15,493,1551,473,760,503,177,124,123,236,848,221,658,771,347,23,264,739,1583,747,17,336,998,159,679,119,2,160,412,873,1480,337,92,369,136,3,188,683,496,214,131,330,493,649,136,503,249,342,240,728,494,150,25,146,95,1328,401,580,743,385,85,1011,466,36,228,1394,77,1009,46,751,782,1501,464,1046,4,317,1566,1661,822,107,487,208,727,53,55,355,370,1319,16,18,965,1582,190,38,386,169,766,111,262,229,248,318,368,70,18,302,87,218,404,265,2,109,62,557,714,1174,429,1082,786,37,470,195,408,598,935,1224,11,83,318,475,354,342,699,209,372,942,801,30,1065,4,110,969,449,266,50,314,771,890,314,394,316,211,1238,84,574,120,698,1382,1039,670,121,281,241,491,742,802,194,41,573,473,824,1283,59,371,1167,32,1645,115,58,845,11,408,1284,414,1618,240,364,991,111,517,146,256,616,968,130,98,414,13,152,332,96,816,366,214,69,1072,1225,98,122,554,236,14,499,89,793,119,945,511,476,112,1201,501,9,23,517,277,283,1600,581,290,248,472,38,144,178,645,477,1016,139,123,4,671,370,1025,290,20,1680,856,212,44,93,656,1163,384,852,461,1248,79,341,1125,812,746,511,1461,420,1070,22,126,274,1698,526,949,20,865,66,1244,157,275,670,384,1142,696,43,74,344,893,237,327,135,272,690,1032,395,1,16,521,1573,304,512,466,243,171,913,323,325,82,16,462,457,1609,24,98,22,528,158,79,1012,60,146,58,504,503,1,42,78,164,3,439,653,217,251,94,584,333,435,254,170,1213,671,548,799,332,434,487,61,710,136,551,556,722,316,365,1403,115,104,597,137,881,577,1334,41,649,177,196,434,191,101,248,14,71,1053,44,1074,51,607,65,161,922,235,132,247,1412,500,1409,15,86,72,327,878,507,1379,454,109,1250,184,19,284,1057,353,476,807,577,305,466,40,136,16,883,516,253,150,125,49,102,404,1606,518,94,1042,204,443,444,22,1197,168,766,1466,1053,695,565,77,406,694,102,84,414,686,800,157,7,516,440,139,1538,144,1327,851,1526,69,315,1078,678,247,1579,100,254,947,758,603,44,535,1242,1117,1119,645,203,97,88,437,886,408,566,351,36,0,461,1098,415,1381,1217,1763,202,1106,466,30,237,757,313,390,38,344,1254,1275,343,278,1064,1116,70,279,276,214,1153,306,67,488,683,432,53,128,91,1082,403,117,1169,568,60,578,475,657,43,509,434,128,1115,872,333,73,954,789,590,185,1305,352,574,266,1634,731,156,562,247,356,743,689,298,637,1125,590,761,123,1508,33,0,558,146,888,236,668,53,94,619,591,422,44,1114,1284,806,39,816,47,59,76,1090,1102,7,1307,676,1161,473,376,175,224,431,284,875,86,28,99,700,459,204,673,1001,31,302,291,386,259,4,181,1048,274,1661,347,614,760,187,1118,196,1076,219,1194,226,909,189,208,265,601,503,693,213,16,63,25,108,133,979,56,195,250,294,920,231,435,1004,352,469,55,1374,605,72,714,534,504,1411,128,724,1216,7,317,948,285,668,320,97,316,298,145,605,40,486,324,399,336,612,386,328,631,44,366,103,109,219,530,39,654,341,132,1090,50,15,654,801,791,169,746,1512,660,383,67,762,46,236,184,51,1051,1161,347,673,554,523,3,463,31,132,258,413,18,293,986,699,608,289,175,70,217,136,857,473,585,14,636,189,119,128,129,358,560,580,425,236,1194,1182,213,79,36,162,200,179,170,892,1398,336,1073,76,798,231,58,216,1134,175,392,688,342,28,300,672,1160,501,44,79,357,1411,856,27,471,600,303,35,546,1466,74,359,234,1200,657,224,431,802,0,584,784,1245,15,776,28,1464,191,275,639,569,179,908,173,1041,630,907,1520,248,1,34,596,53,44,9,782,777,295,818,1295,1115,468,34,530,349,271,99,344,923,733,124,170,208,20,744,530,582,35,58,938,721,253,934,326,528,722,123,0,623,382,889,929,454,457,1024,43,293,521,548,291,654,506,307,1031,1,390,321,727,937,1000,57,52,136,69,920,19,269,950,578,119,207,14,244,274,171,971,548,335,748,553,196,531"
		Dim inputArray() As String = Split(input, ",")
		
		Dim valuesArray(inputArray.Length - 1) as Integer
		
		Dim minPetrol as Integer = 134217728
		Dim minValue as Integer = +134217728
		Dim maxValue as Integer = -134217728
		
		' process the input to integer and find min and max positions
		For index As Integer = 0 To inputArray.Length - 1
		  ' grab the value and convert to string
		  Dim value As Integer
      Int32.TryParse(inputArray(index), value)
      
      ' save to new integer array
      valuesArray(index) = value
      
      If value > maxValue Then
        maxValue = value
      End If
      If value < minValue Then
        minValue = value
      End If
		Next
  
    ' array of petrols per each position
		Dim sumsArray(maxValue) as Integer
		
		' calculate the crab petrol taken to get to each position
		For val1 As Integer = minValue to maxValue
		  Dim totalPetrol as Integer = 0
		  
		  For Each val2 As Integer In valuesArray
		    Dim steps as Integer = Math.Abs(val1 - val2)
        totalPetrol = totalPetrol + Math.floor((((2) + (steps - 1)) / 2) * steps)
		  Next
		  
		  sumsArray(val1) = totalPetrol
		Next
		
		' find minimum petrol
		For Each petrol As Integer In sumsArray
		  If petrol < minPetrol
		    minPetrol = petrol
		  End If
		Next
		
		Console.WriteLine(minPetrol)
    
	End Sub
End Module