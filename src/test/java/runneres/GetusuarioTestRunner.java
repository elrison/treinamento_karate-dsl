package runneres;

import com.intuit.karate.junit5.Karate;

public class GetusuarioTestRunner {

    @Karate.Test
    public  Karate runGetusuarios(){
        return Karate.run("classpath:feature/usuarios/usuariosGet.feature");
    }

}