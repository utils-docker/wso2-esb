FROM fabioluciano/wso2-base
MAINTAINER Fábio Luciano <fabioluciano@php.net>
LABEL Description="WSO2 - ESB"

###

ENV wso2_esb_url 'http://product-dist.wso2.com/products/enterprise-service-bus/'${wso2_esb_version}'/wso2esb-'${wso2_esb_version}'.zip'

###

WORKDIR $wso2_component_directory

RUN curl ${wso2_esb_url} \
    -H 'Referer: http://wso2.com/products/previous-products' \
    --compressed > $(basename ${wso2_esb_url})
RUN unzip $(basename ${wso2_esb_url}) && mv wso2esb-${wso2_esb_version} esb \
  && rm wso2esb-${wso2_esb_version}.zip \
  && mkdir -p /var/log/wso2/esb/
