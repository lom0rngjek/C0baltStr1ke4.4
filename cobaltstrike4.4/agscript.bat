@echo off

java -XX:ParallelGCThreads=4 -XX:+AggressiveHeap -XX:+UseParallelGC -javaagent:hook.jar -classpath ./cobaltstrike.jar aggressor.headless.Start %*
