FROM grafana/k6

ADD script.js .

ENTRYPOINT [ "k6" ]

CMD [ "run", "--duration", "10m", "-o", "experimental-prometheus-rw", "script.js" ]
