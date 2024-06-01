FROM grafana/k6

ADD script.js .

ENTRYPOINT [ "k6" ]

CMD [ "run", "--duration", "10m", "script.js" ]
