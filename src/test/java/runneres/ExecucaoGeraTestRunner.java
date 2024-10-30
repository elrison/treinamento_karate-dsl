package runneres;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ExecucaoGeraTestRunner {

    @Test
    public void runExecucaoGeralParalela(){
        Runner.Builder builder = new Runner.Builder();
        builder.path("classpath:feature/usuarios");
       // builder.tags("@smoke");

        //builder.tags("@smoke");
        Results result = builder.parallel(6);
        Assertions.assertEquals(0,result.getFailCount());
    }
}
