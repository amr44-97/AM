#!/usr/bin/python

with open("./LibStr.c") as file:
    data: str = file.read()

dlist: list = data.split()

print(dlist)

