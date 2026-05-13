FROM gcc:latest

RUN apt-get update && apt-get install -y \
    cmake \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
RUN cmake --build build --config Release

# Важно: запускаем тесты и оставляем контейнер работать
CMD ./build/testproj && echo "Tests completed successfully" && sleep infinity