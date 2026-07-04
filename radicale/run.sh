podman run -d --name radicale \
    -p 5232:5232 \
    --entrypoint /venv/bin/radicale \
    -v /home/trevor/stack_data/radicale/radicale.conf:/config/radicale.conf \
    -v /home/trevor/stack_data/radicale/data:/data \
    --restart always \
    docker.io/tomsquest/docker-radicale:latest \
    --config /config/radicale.conf
