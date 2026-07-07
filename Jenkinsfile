node{
    def app
    stage('Kloniranje repozitorijuma'){
        checkout scm
    }
    stage('Kreiranje slike'){
        app = docker.build("crnogoracmilos/test")
    }
    stage('Testiranje slike'){
        app.inside("--entrypoint=''"){
            sh 'echo "Test je prosao" '
        }
    }
    stage('Izbacujemo sliku'){
        docker.withRegistry('https://registry.hub.docker.com', 'docker-tajna') {
               app.push("${env.BUILD_NUMBER}")
               app.push("latest")
        }
    }
}