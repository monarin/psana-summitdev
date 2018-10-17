newdata = ""
with open('en4') as f:
    for line in f:
        linedata = line.split('\n')
        newdata += "export " + linedata[0] + "\n"

o = open('env_manual.sh', 'w')
o.write(newdata)
