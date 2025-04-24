#!/usr/bin/env python

import typer

# instantiation:
app = typer.Typer()

# have a base file to work with
hosts = """
# Static table lookup for hostnames.
# See hosts(5) for details.

127.0.0.1       localhost ARCH
192.168.1.40    SMM13

"""


# Display entries of the hosts file:
@app.command()
def display():
    print(hosts)

# Add hostnames - requires read/write on hosts file
@app.command()
def add(ip: str, hostname: str, hostname2: str, hostname3: str, hostname4: str):
    f = open("/etc/hosts", "a")
    f.write(f"\n{ip}\t{hostname}")
    print(f" [+] HOSTNAME: {hostname} added to hosts file!")

# Add hosts name from a file (useful to use alongside NXC):
@app.command()
def file(fname: str):
    f = open(fname, "r")
    with open("/etc/hosts", "a") as a:
        a.write(f)
        print(f"Written {fname} into hosts file!")
    

# Reset/Remove all the entries of the hosts file
@app.command()
def flush():
    with open("/etc/hosts", "w") as f:
        f.write(hosts)
        print("[+] Resetted hosts file!")


if __name__ == "__main__":
    app()
