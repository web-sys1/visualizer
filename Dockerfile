FROM node:22-alpine AS builder

WORKDIR /app
COPY package.json ./
RUN npm install

COPY . .
RUN npx gulp

FROM nginx:alpine
COPY --from=builder /app/index.html /usr/share/nginx/html/
COPY --from=builder /app/audio /usr/share/nginx/html/audio
COPY --from=builder /app/viz /usr/share/nginx/html/viz
COPY --from=builder /app/visualizer.min.js /usr/share/nginx/html/
COPY --from=builder /app/visualizer_dev.js /usr/share/nginx/html/
COPY --from=builder /app/analyzer.js /usr/share/nginx/html/
COPY --from=builder /app/canvas.worker.js /usr/share/nginx/html/
COPY --from=builder /app/visualizer.min.js.br /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
