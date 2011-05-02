From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Mon, 2 May 2011 16:11:09 GMT
Message-ID: <201105021611.p42GB9TW006892@demeter2.kernel.org>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=29162


Maximilian Decker <burbon04@gmx.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |burbon04@gmx.de




--- Comment #10 from Maximilian Decker <burbon04@gmx.de>  2011-05-02 16:11:07 ---
hi there,

I'm just curious if there are any news on this ?
I ran into the very same problem (well, at least same symptoms, but nothing
specific in the logs) after upgrading openSuSE 11.3 to 11.4 (kernel
2.6.37.1+suse), running rootfs on ext4, dm-crypted /home with reiserfs
(rw,relatime) and a non-encrypted reiserfs data volume on top of LVM
(rw,noatime,acl).

In my case the system was running for some hours and suddenly after trying to
start "kwrite" (I'm running KDE 4 btw.) the /home - Partition was dead, but
without dataloss after SysRq-reboot. 
As that specific system is kind of support and development system for me, I
immediately reverted back to kernel 2.6.34 (i.e. openSuSE 11.3 kernel) as a
workaround, no freezes since then (several weeks).

I recently also tried to reproduce that issue with Ubuntu and openSuSE on top
of a 2.6.38 kernel, using ramdisks and hard disk partitions, but no luck so
far, test cases ran for hours without a single glitch.

Well, today I switched my openSuSE (the one that crashed the reiserfs once) to
2.6.38. I have made backups, so let's see what happens. 

I wonder if either hardly anyone suffers from this bug or if it is only caused
in some very special combinations, or if it is just gone with 2.6.38.

Reiserfs IMHO has been a rock solid, fast and reliable file system over the
last years, and I would hate to be forced to drop it just because of that silly
weird bug .... :-/


cheers,

- Maximilian

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
