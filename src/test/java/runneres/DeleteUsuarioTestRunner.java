package runneres;

import com.intuit.karate.junit5.Karate;

public class DeleteUsuarioTestRunner {

    @Karate.Test
    public Karate deleteUser(){
        return Karate.run("classpath:feature/usuarios/usuariosDelete.feature");
    }
}
