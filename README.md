<h1>📘 Projeto de Testes Automatizados com Karate DSL</h1>
<p>Este repositório contém testes automatizados usando o Karate DSL integrados ao IntelliJ IDEA e executados em Java. Siga o guia abaixo para configurar o ambiente, as dependências e executar os testes com sucesso.</p>

<h2>🛠️ Pré-requisitos</h2>
<ul>
    <li><strong>Java (versão 8 ou superior)</strong> – Baixe e instale o JDK.</li>
    <li><strong>Karate DSL</strong> – Não requer instalação adicional além da dependência no projeto.</li>
    <li><strong>IntelliJ IDEA</strong> – Baixe e instale o IntelliJ IDEA.</li>
</ul>

<h2>🌐 Configuração de Variáveis de Ambiente</h2>
<p>Após instalar o JDK, configure as variáveis de ambiente para garantir que o Java seja acessível no terminal.</p>

<h3>JAVA_HOME:</h3>
<p>
    <strong>No Windows:</strong><br>
    Vá em Configurações do Sistema &gt; Variáveis de Ambiente. Adicione uma nova variável com o nome <code>JAVA_HOME</code> e valor apontando para o diretório de instalação do JDK (ex.: <code>C:\Program Files\Java\jdk1.8.0_291</code>).
</p>
<p>
    <strong>No Linux/Mac:</strong><br>
    <code>export JAVA_HOME=/caminho/para/jdk</code><br>
    <code>export PATH=$PATH:$JAVA_HOME/bin</code>
</p>
<p>Verifique se o Java está funcionando:</p>
<code>java -version</code>

<h2>🚀 Instalando e Configurando o Projeto no IntelliJ IDEA</h2>
<ol>
    <li><code>git clone &lt;URL_do_repositorio&gt;</code></li>
    <li>Importe o projeto no IntelliJ:</li>
    <ul>
        <li>Abra o IntelliJ IDEA.</li>
        <li>Selecione "Open or Import" e escolha o diretório do projeto.</li>
    </ul>
    <li><strong>Configuração do Maven:</strong><br>Se o projeto usa Maven, o IntelliJ importa as dependências automaticamente a partir do <code>pom.xml</code>.</li>
</ol>

<h2>📝 Estrutura de Arquivos e Diretórios</h2>
<ul>
    <li><code>src/test/java:</code> Contém as classes de teste e runners.</li>
    <li><code>src/test/resources:</code> Contém os arquivos .feature com os cenários de teste em Karate DSL.</li>
</ul>

<h2>📜 Criando e Executando Testes com Karate DSL</h2>
<h3>Exemplo de Arquivo .feature:</h3>
<pre><code>Feature: Testes de API com Karate DSL

Scenario: Validar a resposta da API
    Given url 'http://localhost:8080/api/v1/users'
    When method GET
    Then status 200
    And match response == { id: '#notnull', name: 'John Doe' }
</code></pre>

<h3>Runner de Teste em Java:</h3>
<pre><code>import com.intuit.karate.junit5.Karate;

public class TestRunner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:path/to/feature").relativeTo(getClass());
    }
}
</code></pre>

<h2>🧩 Executando os Testes</h2>
<h3>Via IntelliJ:</h3>
<p>Clique com o botão direito no arquivo <code>TestRunner.java</code> e selecione <strong>Run 'TestRunner'</strong>.</p>

<h3>Via Linha de Comando:</h3>
<code>mvn test -Dkarate.options="--tags @tagName"</code>

<h2>Resultados dos Testes:</h2>
<p>Os relatórios de testes são gerados em <code>target/surefire-reports/karate-summary.html</code>.</p>
