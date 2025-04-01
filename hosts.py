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


@app.command()
def display():
    print(hosts)


@app.command()
def add(ip: str, hostname: str):
    f = open("/etc/hosts", "a")
    f.write(f"\n{ip}\t{hostname}")
    print(f"\n[+] HOSTNAME: {hostname} added to hosts file!")


@app.command()
def flush():
    with open("/etc/hosts", "w") as f:
        f.write(hosts)
        print("[+] Resetted hosts file!")


if __name__ == "__main__":
    app()
