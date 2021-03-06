package ceylon.language;

import com.redhat.ceylon.compiler.java.metadata.Ceylon;
import com.redhat.ceylon.compiler.java.metadata.TypeParameter;
import com.redhat.ceylon.compiler.java.metadata.TypeParameters;
import com.redhat.ceylon.compiler.java.metadata.Variance;

@Ceylon
@TypeParameters({
	@TypeParameter(value="Return", variance=Variance.OUT),
	@TypeParameter(value="CallableArgument")
})
public interface Callable<Return,Argument> {

}
