#!/bin/bash
kill `ps -aux | grep CCNController-1.0.jar | awk '{print $2}'`
kill `ps -aux | grep CCNRouter-1.0.jar | awk '{print $2}'`
