import gdb
import re

class FastUntil(gdb.Command):
    def __init__(self):
        super(FastUntil, self).__init__("skpl", gdb.COMMAND_USER)

    def invoke(self, arg, from_tty):
        pc_value = gdb.execute("x/10i $pc", to_string=True).split("\n")[4:5][0]
        r = re.compile(r"0x[a-f0-9]+? ")
        pc_value = r.search(pc_value).group(0)
        gdb.execute(f"b *{pc_value}")
        gdb.execute(f"conti")

FastUntil()
