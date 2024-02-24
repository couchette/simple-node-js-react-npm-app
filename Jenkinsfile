pipeline {
    agent none
    stages {
        stage('front-end test') { 
            agent {
                docker {
                    image 'node:20.11.1-alpine3.19' 
                    args '-p 3000:3000' 
                }
            }
            steps {
                sh 'npm install'
                sh './jenkins/scripts/test.sh'
                sh './jenkins/scripts/deliver.sh' 
                input message: 'Finished using the web site? (Click "Proceed" to continue)' 
                sh './jenkins/scripts/kill.sh' 
            }
        }
        stage("Publish") {
            sshPublisher(publishers: [sshPublisherDesc(configName: 'test0', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''apt-get install unzip
            cd /home
            mkdir workspace
            rm -r workspace/simple-node-js-react-npm-app-master
            unzip simple-node-js-react-npm-app-master.zip -d workspace && rm -f simple-node-js-react-npm-app-master.zip
            cd /home/workspace/simple-node-js-react-npm-app-master
            chmod +x install_docker.sh
            chmod +x build_and_run_docker.sh
            ./install_docker.sh > install_docker.out
            ./build_and_run_docker.sh > build_and_run_docker.out
            ''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/home', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'simple-node-js-react-npm-app-master.zip')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)])
        }
    }
}

