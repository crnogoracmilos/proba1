node{
    def app
    stage('Kloniranje repozitorijuma'){
        checkout scm
    }
    stage('Kreiranje slike'){
        app = docker.build("crnogoracmilos/test")
    }
    stage('Testiranje slike'){
        app.inside{
            sh 'echo "Test je prosao" '
        }
    }
    stage('Izbacujemo sliku'){
        docker.withRegistry('https://registry.hub.docker.com', 'a47509ad-a441-4b79-beb7-15ecb957af29') {
               app.push("${env.BUILD_NUMBER}")
               app.push("latest")
        }
    }
}