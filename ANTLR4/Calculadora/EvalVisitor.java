import java.util.HashMap;
import java.util.Map;

public class EvalVisitor extends LabeledExprBaseVisitor<Double> {
    Map<String, Double> memory = new HashMap<>();
	
	/** ID '=' expr NEWLINE */
	@Override
	public Double visitAssign(LabeledExprParser.AssignContext ctx) {
		String id = ctx.ID().getText(); // id is left-hand side of '='
		double value = visit(ctx.expr()); // compute value of expression on right
		memory.put(id, value); // store it in our memory
		return value;
	}
	/** expr NEWLINE */
	@Override
	public Double visitPrintExpr(LabeledExprParser.PrintExprContext ctx) {
		Double value = visit(ctx.expr()); // evaluate the expr child
		System.out.println(value); // print the result
		return 0.0; // return dummy value
	}
	
	/** INT */
	@Override
	public Double visitInt(LabeledExprParser.IntContext ctx) {
		return Double.valueOf(ctx.INT().getText());
	}
	
	/** ID */
	@Override
	public Double visitId(LabeledExprParser.IdContext ctx) {
		String id = ctx.ID().getText();
		if ( memory.containsKey(id) ) return memory.get(id);
		return 0.0;
	}
	
	/** expr op=('*'|'/') expr */
	@Override
  public Double visitMulDiv(LabeledExprParser.MulDivContext ctx) {
      double left = visit(ctx.expr(0));
      double right = visit(ctx.expr(1));
      return ctx.op.getType() == LabeledExprParser.MUL ? left * right : left / right;
  }
	
	/** expr op=('+'|'-') expr */
	@Override
	public Double visitAddSub(LabeledExprParser.AddSubContext ctx) {
    double left = visit(ctx.expr(0));
    double right = visit(ctx.expr(1));
    return ctx.op.getType() == LabeledExprParser.ADD ? left + right : left - right;
  }
	
	/** '(' expr ')' */
	@Override
	public Double visitParens(LabeledExprParser.ParensContext ctx) {
		return visit(ctx.expr()); // return child expr's value
	}
	
	@Override
  public Double visitSin(LabeledExprParser.SinContext ctx) {
      double value = visit(ctx.expr());
      boolean isRad = ctx.prefix != null && ctx.prefix.getText().equalsIgnoreCase("rad");
      return isRad ? Math.sin(value) : Math.sin(Math.toRadians(value));
  }

  @Override
  public Double visitCos(LabeledExprParser.CosContext ctx) {
      double value = visit(ctx.expr());
      boolean isRad = ctx.prefix != null && ctx.prefix.getText().equalsIgnoreCase("rad");
      return isRad ? Math.cos(value) : Math.cos(Math.toRadians(value));
  }

  @Override
  public Double visitTan(LabeledExprParser.TanContext ctx) {
      double value = visit(ctx.expr());
      boolean isRad = ctx.prefix != null && ctx.prefix.getText().equalsIgnoreCase("rad");
      return isRad ? Math.tan(value) : Math.tan(Math.toRadians(value));
  }


  @Override
  public Double visitSqrt(LabeledExprParser.SqrtContext ctx) {
      return Math.sqrt(visit(ctx.expr()));
  }

  @Override
  public Double visitLn(LabeledExprParser.LnContext ctx) {
      return Math.log(visit(ctx.expr()));
  }

  @Override
  public Double visitLog(LabeledExprParser.LogContext ctx) {
      return Math.log10(visit(ctx.expr()));
  }

  @Override
  public Double visitFactorial(LabeledExprParser.FactorialContext ctx) {
      double raw = visit(ctx.expr());
      int n = (int) raw;

      if (raw != n || n < 0) {
          System.out.println("Negativo o decimal no se puede, tonto ");
          return raw;
      }

      double result = 1.0;
      for (int i = 2; i <= n; i++) result *= i;
      return result;
  }


}

