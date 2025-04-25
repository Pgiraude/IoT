#!/bin/bash

LOCAL_HOST_IP="127.0.0.1"

echo "${LOCAL_HOST_IP} app1.com app2.com" | sudo tee -a /etc/hosts