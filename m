From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiser4 on Loop Device
Date: Wed, 9 Mar 2005 13:17:03 +0300
Message-ID: <200503091317.03619.vitaly@namesys.com>
References: <20050309074755.GA10678@atlantis.dolphins.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050309074755.GA10678@atlantis.dolphins.ch>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, Philipp Morger <philipp.morger@dolphins.ch>

On Wednesday 09 March 2005 10:47, Philipp Morger wrote:
> Dear List,
> 
> I'm having difficulties running reiser4 on a loop device:
> 
> --(#:~)-- dd if=/dev/zero of=testfile bs=1M count=500
> 500+0 records in
> 500+0 records out
> --(#:~)-- losetup /dev/loop/0 testfile
> --(#:~)-- losetup -a
> /dev/loop/0: [0802]:55565837 (testfile)
> --(#:~)-- mkfs.reiser4 /dev/loop/0
> mkfs.reiser4 0.4.18
> Copyright (C) 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4progs/COPYING.
> 
> Block size 4096 will be used.
> Linux 2.6.11-rc5-mm1 is detected.
> Uuid 7f5aa34e-c3b5-4463-85c4-b49f7a73176b will be used.
> Reiser4 is going to be created on /dev/loop/0.
> (Yes/No): Yes
> Creating reiser4 on /dev/loop/0...done
> --(#:~)-- fsck.reiser4 /dev/loop/0
>   *************************************************************
>   ** If you are using the latest reiser4progs and  it fails **
>   ** please  email bug reports to reiserfs-list@namesys.com, **
>   ** providing  as  much  information  as  possible --  your **
>   ** hardware,  kernel,  patches,  settings,  all  reiserfsk **
>   ** messages  (including version), the reiser4fsck logfile, **
>   ** check  the  syslog file  for  any  related information. **
>   ** If you would like advice on using this program, support **
>   ** is available  for $25 at  www.namesys.com/support.html. **
>   *************************************************************
> 
> Fscking the /dev/loop/0 block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will check the consistency of the Reiser4 FileSystem.
> Will use (default) params.
> Continue?
> (Yes/No): Yes
> ***** Openning the fs.
> Fatal: Device operation "read" isn't implemented.
> Fatal: Can't read master super block.
> Fatal: Failed to open the master super block.
> Fatal: Cannot open the FileSystem on (/dev/loop/0).
> Segmentation fault
> 
> 
> Versions in use:
> 
> --(#:~)-- uname -a
> Linux eternity 2.6.11-rc5-mm1 #1 Tue Mar 8 11:11:03 CET 2005 i686 Intel(R) Pentium(R) 4 CPU 2.40GHz GenuineIntel GNU/Linux
> 
> --(#:~)-- ldd /usr/sbin/mkfs.reiser4
>         linux-gate.so.1 =>  (0xffffe000)
>         libreiser4-0.4.so.18 => /usr/lib/libreiser4-0.4.so.18 (0x4cd45000)
>         libaal-0.4.so.13 => /usr/lib/libaal-0.4.so.13 (0x4ccef000)
>         libuuid.so.1 => /lib/libuuid.so.1 (0xb7f28000)
>         libncurses.so.5 => /lib/libncurses.so.5 (0xb7ed1000)
>         libreadline.so.4 => /lib/libreadline.so.4 (0x467e6000)
>         libc.so.6 => /lib/libc.so.6 (0xb7da8000)
>         /lib/ld-linux.so.2 (0xb7f47000)

please update your libaal & reiser4progs to the latest version.
(ftp://ftp.namesys.com/pub/reiser4progs/)

-- 
Thanks,
Vitaly Fertman
