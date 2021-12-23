FROM grafana/grafana:8.1.4

LABEL author="ZCQ"
LABEL email="1229896069@qq.com"
LABEL version="1.0"
LABEL description="web ui uesd for oai project"
LABEL reference="mysql配置位于./grafana/grafana/provisioning/datasources/sample.yaml中"

ENV GF_USERS_ALLOW_SIGN_UP false
ENV GF_USERS_ALLOW_ORG_CREATE false
ENV GF_USERS_AUTO_ASSIGN_ORG_ROLE "Read Only Editor "
# 初始化grafana的时候加载grafana插件
ENV GF_INSTALL_PLUGINS agenty-flowcharting-panel

# 加载grafana的配置文件
COPY ./grafana/grafana /etc/grafana
# 加载grafana的dashboards的JSON文件
COPY ./grafana/dashboards /var/lib/grafana/dashboards
# 加载grafana的plugins文件
# COPY ./grafana/plugins /var/lib/grafana/plugins
EXPOSE 3000