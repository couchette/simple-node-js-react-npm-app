pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'node:14' // 使用Node.js 14的Docker镜像，你可以根据需要更改版本
        CONTAINER_NAME = 'node_app'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Run Docker Container') {
            steps {
                script {
                    // 构建并运行Docker容器
                    docker.image(DOCKER_IMAGE).run('-p 3000:3000 -d --name ${CONTAINER_NAME} -v ${WORKSPACE}:/app', 'sh -c "cd /app && npm install && npm start"')
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // 运行测试（如果适用）
                    docker.inside("${CONTAINER_NAME}") {
                        sh 'npm test'
                    }
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    // 清理工作，停止并删除Docker容器
                    docker.image(DOCKER_IMAGE).inside {
                        sh "docker stop ${CONTAINER_NAME} || true"
                        sh "docker rm ${CONTAINER_NAME} || true"
                    }
                }
            }
        }
    }
}
