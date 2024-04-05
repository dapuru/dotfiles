#!/usr/bin/env python
# https://gist.github.com/bjesus/178a9bd3453470d74803945dbbf9ed40

import json
import subprocess
data = {}
output = subprocess.check_output("khal list now 7days --format \"{start-end-time-style} {title}\"", shell=True).decode("utf-8")
lines = output.split("\n")
new_lines = []
for line in lines:
    if len(line) and line[0].isalpha():
        line = "\n<b>"+line+"</b>"
    new_lines.append(line)
output = "\n".join(new_lines).strip()
if "Today" in output:
    data['text'] = " <span foreground='red'> </span>"
    data['alt'] = " <span foreground='red'> </span>" + output.split('\n')[1]
else:
    data['text'] = " "
    data['alt'] = " "
data['tooltip'] = output
print(json.dumps(data))
