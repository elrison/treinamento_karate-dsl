package runneres;

import com.intuit.karate.junit5.Karate;

public class PutUserTestRunner {

    @Karate.Test
    public  Karate runPutUsuario(){
        return Karate.run("classpath:feature/usuarios/usuariosPut.feature");
    }

}
