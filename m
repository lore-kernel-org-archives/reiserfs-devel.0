From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: Urgent: problems after crush
Date: Sun, 1 Dec 2002 09:01:02 -0500
Message-ID: <200212010901.02648.tomlins@cam.org>
References: <5.1.1.6.2.20021201134854.00ce13b8@192.168.2.131>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12079-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5.1.1.6.2.20021201134854.00ce13b8@192.168.2.131>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: system_lists@nullzone.org, reiserfs-list@namesys.com

On December 1, 2002 07:58 am, system_lists@nullzone.org wrote:
> Hi there,
>
>     i have a problem on my web server. Trying to star the apache-web-daemon
> i get always this message (in a reiserfs x.xx.xx partition).
>
> Dec  1 14:37:01 server01 kernel: attempt to access beyond end of device
> Dec  1 14:37:01 server01 kernel: 03:04: rw=0, want=0, limit=2185344
> Dec  1 14:37:01 server01 kernel: attempt to access beyond end of device
> Dec  1 14:37:01 server01 kernel: 03:04: rw=0, want=0, limit=2185344
> Dec  1 14:37:10 server01 kernel: init_special_inode: bogus imode (2000)
>
>
> It'is so after a hardware problem which halted the system.
> After fixing the problem i cannot start the daemon.
>
> I have recompiled the daemon, created new log files (re-done all which
> apache access in a boot (pid files, directories..)).
> I have done a reiserfsck and all is ok ..
>
> im a bit lost...

I would start by downloading reiserfsck 3.6.4 and checking my drive.  If 
its ok you still have a hardware problem.  If not do what reiserfsck 
suggests (make sure you have a why to recreate your data - just in case).
I have used reiserfsck many times with good results here.

If you need a standalone boot cd try downloading knnopix.  You will want
to put reiserfsck 3.6.4 on a floppy as knnopix has 3.6.3 on it.

Ed Tomlinson
