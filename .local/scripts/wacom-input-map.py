#!/usr/bin/env python3
import subprocess


def main():
    cmd = []
    cmd.append("xinput")

    output = subprocess.run(cmd, capture_output=True, shell=True)
    lines = output.stdout.splitlines()

    stylus = []
    for line in lines:
        if "wacom" in line.decode('utf8').strip().lower():
            stylus.append(line.decode("utf8"))

    id = []
    for line in stylus:
        tmp = line.split("\t")
        id.append(tmp[1].split("=")[-1])

    for val in id:
        cmd = []
        cmd.append("xinput")
        cmd.append("map-to-output")
        cmd.append(val)
        cmd.append("HDMI-A-0")
        subprocess.run(cmd)


if __name__ == "__main__":
    main()
