@tailrec
def f [X] (xs:List[X], ys:List[X]) : List[X] = {
   xs match{
      case Nil => ys
      case z::zs => f(zs,z::ys)
   }
}
