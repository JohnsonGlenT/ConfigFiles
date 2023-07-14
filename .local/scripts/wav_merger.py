#!/usr/bin/env python3
import os
import subprocess


def main():
    dir = os.listdir("tmp")
    dir.sort()

    wavs = []
    for file in dir:
        if file.endswith('.wav'):
            wavs.append(file)

    os.chdir('tmp')

    tmp1 = True
    command = ['sox']
    batch = []

    for wav in wavs:
        if len(batch) == 1000:
            exe = command + batch
            if tmp1:
                exe.append("tmp1.wav")
            else:
                exe.append("tmp2.wav")
            subprocess.run(exe)

            if tmp1:
                batch = ['tmp1.wav']
                tmp1 = False
            else:
                batch = ['tmp2.wav']
                tmp1 = True

        batch.append(wav)

    if len(batch) < 2:
        if tmp1:
            os.rename('tmp1.wav', 'output.wav')
        else:
            os.rename('tmp2.wav', 'output.wav')

    else:
        exe = command + batch + ['output.wav']
        subprocess.run(exe)


if __name__ == "__main__":
    main()
