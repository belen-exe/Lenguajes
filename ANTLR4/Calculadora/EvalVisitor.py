from LabeledExprVisitor import LabeledExprVisitor
from LabeledExprParser import LabeledExprParser
import math

class EvalVisitor(LabeledExprVisitor):
    def __init__(self):
        self.memory = {}

    def visitAssign(self, ctx):
        id_name = ctx.ID().getText()
        value = self.visit(ctx.expr())
        self.memory[id_name] = value
        return value

    def visitPrintExpr(self, ctx):
        value = self.visit(ctx.expr())
        print(value)
        return 0.0

    def visitInt(self, ctx):
        return float(ctx.INT().getText())

    def visitId(self, ctx):
        id_name = ctx.ID().getText()
        return self.memory.get(id_name, 0.0)

    def visitMulDiv(self, ctx):
        left = self.visit(ctx.expr(0))
        right = self.visit(ctx.expr(1))
        if ctx.op.type == LabeledExprParser.MUL:
            return left * right
        else:  # DIV
            if right == 0:
                print("División por cero no se puede ")
                return 0.0
            return left / right


    def visitAddSub(self, ctx):
        left = self.visit(ctx.expr(0))
        right = self.visit(ctx.expr(1))
        return left + right if ctx.op.type == LabeledExprParser.ADD else left - right

    def visitParens(self, ctx):
        return self.visit(ctx.expr())

    def _is_radians(self, ctx):
        return hasattr(ctx, "prefix") and ctx.prefix is not None and ctx.prefix.text.lower() == "rad"

    def visitSin(self, ctx):
        value = self.visit(ctx.expr())
        is_radians = ctx.prefix is not None and ctx.prefix.text.lower() == "rad"
        return math.sin(value if is_radians else math.radians(value))


    def visitCos(self, ctx):
        value = self.visit(ctx.expr())
        is_radians = ctx.prefix is not None and ctx.prefix.text.lower() == "rad"
        return math.cos(value if self._is_radians(ctx) else math.radians(value))

    def visitTan(self, ctx):
        value = self.visit(ctx.expr())
        is_radians = ctx.prefix is not None and ctx.prefix.text.lower() == "rad"
        return math.tan(value if self._is_radians(ctx) else math.radians(value))


    def visitSqrt(self, ctx):
        return math.sqrt(self.visit(ctx.expr()))

    def visitLn(self, ctx):
        return math.log(self.visit(ctx.expr()))

    def visitLog(self, ctx):
        return math.log10(self.visit(ctx.expr()))

    def visitFactorial(self, ctx):
        raw = self.visit(ctx.expr())
        n = int(raw)

        if raw != n or n < 0:
            print(f"Negativo o decimal no se puede {raw}")
            return raw

        result = 1.0
        for i in range(2, n + 1):
            result *= i
        return result

