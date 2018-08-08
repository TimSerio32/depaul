def printList(xs:List[Int]) = xs.foreach((x:Int) => println(x))

def squaredList(xs:List[Int]) = xs.map((x:Int) => x*x)

def odds(xs:List[Int]) = xs.filter((x:Int) => x % 2 == 1)

def mreThanFive(xs:List[Int]) = xs.find((x:Int) => x >= 5)

def numMreThanFive(xs:List[Int]) = xs.count((x:Int) => x >= 5)

def isNumMreThanFive(xs:List[Int]) = xs.exists((x:Int) => x >= 5)

def allMreThanFive(xs:List[Int]) = xs.forall((x:Int) => x >= 5)
