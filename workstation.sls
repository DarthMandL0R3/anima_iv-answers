install-firefox:
  cmd.run:
    {% if grains['osrelease'] == '18.04' %}
	-name: |
            cd /tmp
            wget https://ftp.mozilla.org/pub/firefox/releases/89.0/linux-x86_64/en-US/firefox-89.0.tar.bz2
            tar xzf firefox-89.0.tar.bz2
            cd firefox-89.0
            ./configure --prefix=/usr/local
            make
            make install
    - cwd: /tmp
    - shell: /bin/bash
    - timeout: 300
    - unless: test -x /usr/local/bin/firefox
	{% elif grains['osrelease'] == '16.04' %}
	-name: |
            cd /tmp
            wget https://ftp.mozilla.org/pub/firefox/releases/89.0/linux-x86_64/en-US/firefox-85.0.tar.bz2
            tar xzf firefox-85.0.tar.bz2
            cd firefox-85.0
            ./configure --prefix=/usr/local
            make
            make install
    - cwd: /tmp
    - shell: /bin/bash
    - timeout: 300
    - unless: test -x /usr/local/bin/firefox
	{% endif %}