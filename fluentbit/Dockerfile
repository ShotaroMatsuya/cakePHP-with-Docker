FROM amazon/aws-for-fluent-bit:latest

COPY ./fluentbit/fluent-bit_custom.conf /fluent-bit/etc/fluent-bit_custom.conf
COPY ./fluentbit/parsers.conf /fluent-bit/etc/parsers.conf
COPY ./fluentbit/mod_record.lua /fluent-bit/etc/mod_record.lua
COPY ./fluentbit/stream_processing.conf /fluent-bit/etc/stream_processing.conf

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
