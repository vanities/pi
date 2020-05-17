FROM mono

# Update and install a zip utility
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget zip && \
    apt-get clean

# fix for favorites.json error
RUN favorites_path="/root/My Games/Terraria" && \
    mkdir -p "$favorites_path" && \
    echo "{}" > "$favorites_path/favorites.json"

# Download and install Terraria
ENV DOWNLOAD_URL=https://terraria.org/system/dedicated_servers/archives/000/000/036/original/terraria-server-1402.zip

RUN mkdir /tmp/terraria && \
    cd /tmp/terraria && \
    wget $DOWNLOAD_URL && \
    unzip -q terraria-server-1402.zip && \
    mv */Linux /vanilla && \
    rm -R /tmp/* && \
    chmod +x /vanilla/TerrariaServer* && \
    rm -rf /vanilla/System.*.dll /vanilla/System.dll

COPY run-vanilla.sh /vanilla/run.sh
