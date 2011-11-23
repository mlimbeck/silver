package silAST.expressions.terms
import silAST.AtomicNode
import silAST.symbols.ProgramVariable
import silAST.source.SourceLocation
import silAST.expressions.program.terms.ProgramTermNode
import silAST.ASTNode

class ProgramVariableNode(
		sl : SourceLocation, 
		val variable : ProgramVariable 
	) 
	extends ProgramTermNode(sl) 
	with AtomicTermNode[ProgramVariableNode]
{
	assert(variable!=null);
	
	override def toString(): String = { return variable.name; }
	override def subNodes : Seq[ASTNode] = { return variable :: Nil }
}