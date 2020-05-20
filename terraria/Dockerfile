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

# Download and install vanilla Terraria
ENV DOWNLOAD_URL=https://terraria.org/system/dedicated_servers/archives/000/000/036/original/terraria-server-1402.zip

RUN mkdir -p /terraria/vanilla && \
    cd /terraria/vanilla && \
    wget $DOWNLOAD_URL && \
    unzip -q terraria-server-1402.zip && \
    rm -rf terraria-server-1402.zip && \
    mv 1402/Linux/* /terraria/vanilla && \
    rm -rf 1402 && \
    chmod +x TerrariaServer* && \
    rm -rf System.*.dll System.dll

RUN mkdir -p /terraria/tshock/ && \
    wget https://github.com/Pryaxis/TShock/releases/download/v4.4.0-pre4/TShock_4.4.0_226_Pre4v2_Terraria1.4.0.2.zip && \
    unzip TShock_4.4.0_226_Pre4v2_Terraria1.4.0.2.zip && \
    rm -rf TShock_4.4.0_226_Pre4v2_Terraria1.4.0.2.zip
