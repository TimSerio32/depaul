def maximum (xs:List[Int]) : Option[Int] = {
  xs match{
     case Nil => None
     case y::ys => 
	maximum(ys)match{
	  case None => Some(y)
	  case Some(z) => Some(y max z)
        }
  }
}


def find [X] (xs:List[X], p:X=>Boolean) : Option[X] = {
  xs match{
     case Nil => None
     case y::ys if p(y) => Some(y)
     case _::ys  => find(ys,p)
  }
}


def oneFind(xs:List[String], s:String) : Option[String] = {
  xs.find((x:String) => (x.length > s.length) && x.contains (s))
}

def twofind(xs:List[String],s:String) : Option[String] = {
   oneFind(xs,s) match{
     case None => None
     case Some(t) => oneFind(xs,t)
   }
}
