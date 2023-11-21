FROM --platform=linux/amd64 debian:stable-slim

# instala o sistema de geracao de kdm
RUN apt update
ARG DCPOMATIC_INSTALLER=dcpomatic-cli_2.16.66-1_amd64_debian.deb
COPY $DCPOMATIC_INSTALLER /tmp/
RUN apt install -y /tmp/$DCPOMATIC_INSTALLER
COPY dudu_config.xml /root/.config/dcpomatic2/config.xml

#gera um kdm de teste
COPY dudu_cert.pem /opt/dcpomatic/test_cert.pem
COPY dudu_dkdm.xml /opt/dcpomatic/test_dkdm.xml
RUN dcpomatic2_kdm_cli -C "/opt/dcpomatic/test_cert.pem" -f now -d "1 week" "/opt/dcpomatic/test_dkdm.xml" -o "/tmp" -K "teste"

#limpa o tmp
RUN rm -rf /tmp/*

#entrypoint
#CMD dcpomatic2_kdm_cli -C "/opt/dcpomatic/test_cert.pem" -f now -d "1 week" "/opt/dcpomatic/test_dkdm.xml" -o "/tmp" -K "teste" && cd "/tmp" && python3 -m http.server 8000
CMD dcpomatic2_kdm_cli -C "/opt/dcpomatic/test_cert.pem" -f now -d "1 week" "/opt/dcpomatic/test_dkdm.xml" -o "/tmp" -K "teste" && cat "/tmp/teste.xml" && bash
#CMD dcpomatic2_kdm_cli -C "/opt/dcpomatic/test_cert.pem" -f now -d "1 week" "/opt/dcpomatic/test_dkdm.xml" -o "/tmp" -K "teste" && cat "/tmp/teste.xml"
#CMD bash
