import java.util.function.*;

@FunctionalInterface
public interface CList<A> {

  public <R> R fold(R ifEmpty, BiFunction<R,A,R> ifCons);


  public static <A> CList<A> empty() {
      return new CList<A>() {
          public <R> R fold(R ifEmpty, BiFunction<R,A,R> ifCons) {
              return ifEmpty;
          }
      };
  }
    
  public static <A> CList<A> cons(A head, CList<A> tail) {
      return new CList<A>() {
          public <R> R fold(R ifEmpty, BiFunction<R,A,R> ifCons) {
              return ifCons.apply(tail.fold(ifEmpty, ifCons), head); 
          }
      };
  }

  public default java.util.List<A> toList() {
    throw new RuntimeException();
  }
}


interface ChurchOption<A> {

  public <R> R fold(R ifNone, Function<A,R> ifSome);

}


interface ChurchPair<A,B> {

  public <R> R fold(BiFunction<A,B,R> onPair);

}
