# -*- encoding: utf-8 -*-
# je me doute bien que c'est innaproprié de faire du Python dans un
# projet en Scheme, mais j'ai pas assez de temps pour faire ce petit
# script en Scheme, et encore moins en bash/makefile

import os
import subprocess
import sys
from subprocess import Popen, PIPE, STDOUT

untested = []

def scan_file(path):
    lines = file(path,'r').read().splitlines()
    exp = inp = cmd = ""
    for i in lines:
        if ";;@" in i:
            exp += i[i.rindex(";;@")+4:].strip()+"\n"
        if ";;#" in i:
            inp += i[i.rindex(";;#")+4:].strip()+"\n"
        if ";;&" in i:
            if cmd != "":
                print
                print "Warning, redefining command line arguments for test",path
                print "at line",i
            cmd = i[i.rindex(";;&")+4:].strip()
    return exp,inp,cmd

for i in os.listdir("test"):
    sys.stdout.write("."+i)
    sys.stdout.flush()
    if i.startswith("ok_test") or ("-" in i and i[:i.index('-')].isdigit()):
        s = ""
        try:
            s = subprocess.check_output("./roc test/"+i,
                                        shell=True)
            po = ""
            expected,pinput,command_line_args = scan_file("test/"+i)
            try:
                p = Popen(['./out']+command_line_args.split(" "),
                          stdout=PIPE, stdin=PIPE, stderr=STDOUT)
                po = p.communicate(input=pinput)[0]
            except subprocess.CalledProcessError,e:
                if e.returncode != 0:
                    print i
                    print "Unexpected return code:",e.returncode
                    print "roc output:",s
                    print e.output
                    continue
            if expected != po:
                print i
                print "Unexpected output:"
                print po
                print repr(po)
                print "Expected:"
                print expected
                print repr(expected)
                print "roc and asmbler output:",s
        except subprocess.CalledProcessError,e:
            print "Test should not have failed:",i,e
            print s
            print e.output
    elif i.startswith("fail_test"):
        try:
            s = subprocess.check_output("./roc test/"+i,
                                        shell=True,
                                        stderr=subprocess.STDOUT)
            s += subprocess.check_output("gcc out.s -o out",
                                         shell=True,
                                         stderr=subprocess.STDOUT)
            try:
                po = subprocess.check_output("./out",
                                             shell=True)
            except subprocess.CalledProcessError,e:
                if e.returncode == 0:
                    print i
                    print "Unexpected return code",e.returncode,"should have been 0"
                    print s
                    print e.output
                continue
            print "Test should have failed:",i
            print s
            print po
        except subprocess.CalledProcessError,e:
            pass
    else:
        untested.append(i)

print
print "End of testing."
if untested:
    print "Did not test files:",",".join(untested)
