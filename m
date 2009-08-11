From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13536] crash while copying atime with touch
Date: Tue, 11 Aug 2009 14:33:00 GMT
Message-ID: <200908111433.n7BEX04Z027790@demeter.kernel.org>
References: <bug-13536-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13536-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13536


Roland Kletzing <devzero@web.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |devzero@web.de




--- Comment #11 from Roland Kletzing <devzero@web.de>  2009-08-11 14:33:00 ---
>However finding the kernel module that causes the crash by binary search is >almost impossible since there is no crash as soon as all requests can be 
>satisfied from the cache

so, for each iteration you will need a reboot before, right ?

but, what`s the problem with that ? ;)

i`d go this way:

1. make a list of all modules you want to unload.
2. name that file however you want
3. do "cat file.list |while read module;do modprobe -r $module;done"
4. test
5. after the next crash, cut that file into 2 parts and repeat 3+4
6. in theory, one of the file should contain the "bad" module. name that file
appropriately (.good / .bad)
7. take the .bad file and repeat the steps until bisection results with a file
containing a single module

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
