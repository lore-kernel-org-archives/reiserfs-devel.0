From: Domenico Andreoli <cavok@libero.it>
Subject: Re: fscking a reiserfs 3.6 filesystem with reiser4progs 0.4.18 segfaults
Date: Mon, 22 Dec 2003 11:52:11 +0100
Message-ID: <3FE6CCDB.2030200@libero.it>
References: <3FE5A1AA.8040200@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16369-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FE5A1AA.8040200@libero.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Domenico Andreoli wrote:
> i tried to check a reiserfs 3.6 filesystem with fsck.reiser4 and it 
> segfaulted. is reiser4progs expected to work correctly with older 
> reiserfs filesystems?
> 
> i'm using a 2.6.0 kernel patched with reiser4 from 2003.11.12. libaal 
> 0.4.13 and reiser4progs 0.4.18.
> 
> let me know if more info are required.
> 
now that i look at it, fsck.reiser4 does not even check a reiser4 fs :(

# mkfs.reiser4 /dev/hdc6
mkfs.reiser4 0.4.18
Copyright (C) 2001, 2002, 2003 by Hans Reiser, licensing governed by 
reiser4progs/COPYING.

Block size 4096 will be used. 

Linux 2.6.0-cavok is detected. 

Uuid 9ad355b3-1520-450e-9471-dee1765a7466 will be used. 

Reiser4 is going to be created on /dev/hdc6. 

(Yes/No): yes
Creating reiser4 on /dev/hdc6...done
# fsck.reiser4 /dev/hdc6
   *************************************************************
   ** If you are using the latest reiser4progs and  it fails **
   ** please  email bug reports to reiserfs-list@namesys.com, **
   ** providing  as  much  information  as  possible --  your **
   ** hardware,  kernel,  patches,  settings,  all  reiserfsk **
   ** messages  (including version), the reiser4fsck logfile, **
   ** check  the  syslog file  for  any  related information. **
   ** If you would like advice on using this program, support **
   ** is available  for $25 at  www.namesys.com/support.html. **
   *************************************************************

Fscking the /dev/hdc6 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Will use (default) params.
Continue? 

(Yes/No): yes
***** Openning the fs.
Fatal: Device operation "read" isn't implemented. 

Fatal: Can't read master super block. 

Fatal: Failed to open the master super block. 

Fatal: Cannot open the FileSystem on (/dev/hdc6). 

zsh: segmentation fault (core dumped)  fsck.reiser4 /dev/hdc6
#

any hint?

BTW: note the "***** Openning the fs.", it should be "Opening" instead 
of "Openning".

cheers
domenico

-----[ Domenico Andreoli, aka cavok
  --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
    ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
