#!/bin/bash

mv ./kasm_user/_README ./_README
rm -rf ./kasm_user/*
rm -rf ./kasm_user/.*
mv ./_README ./kasm_user/_README