# 使用官方 Node.js 14 镜像作为基础镜像
FROM node:14

# 设置工作目录
WORKDIR /usr/src/app

# 复制整个项目到工作目录
COPY . .
RUN npm install --registry https://registry.npmmirror.com
RUN npm install -g serve --registry https://registry.npmmirror.com


# 构建应用
RUN npm run build

# 定义启动命令
CMD [ "serve", "-s", "build" ]
