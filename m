From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Reiser4 pokes into R3
Date: Mon, 11 Apr 2005 12:48:24 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0504111239200.9619@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0504061941430.26625@yvahk01.tjqt.qr>
 <1112941832.3777.77.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23839-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1112941832.3777.77.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

>> [please Cc, i'm not subscribed atm]
>> 
>> Hello list,
>> 
>> 
>> after I started using a loop-mounted reiser4 fs, I was getting
>> ReiserFS: hda1: warning: clm-2100: nesting info a different FS
>
>would you try to see whether the attached patch helps?

The patch reduces the statistical probability for clm-2100, but does not get 
rid of it. I wonder anyhow, given this stack trace:

 ReiserFS: hda1: warning: clm-2100: nesting info a different FS
 ReiserFS: hda1: warning: clm-2100+1: t_super = 4b1b5d0b
  [<c01b3598>] journal_begin+0x68/0x140
  [<c01a28c1>] reiserfs_dquot_drop+0x31/0x70
  [<d1eb72d1>] reiser4_destroy_inode+0xa1/0xb0 [reiser4]
  [<c01500f1>] invalidate_inode_buffers+0x11/0x50
  [<c01671e4>] clear_inode+0x134/0x140
  [<c016720d>] dispose_list+0x1d/0xa0
...

that there's reiser4_destroy_inode() in the mid. Other stacktraces (most of 
them) have

  [<c01b3598>] journal_begin+0x68/0x140
  [<c01a28c1>] reiserfs_dquot_drop+0x31/0x70
  [<c01500f1>] invalidate_inode_buffers+0x11/0x50
  [<c01671e4>] clear_inode+0x134/0x140
  [<c016720d>] dispose_list+0x1d/0xa0

though.

>Are there any nfs mounts/shares when you get this problem?

No.
12:42 eax:~ > df -Ta
Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/hda1 reiserfs    34337852  15990992  18346860  47% /
proc          proc           0         0         0   -  /proc
sysfs        sysfs           0         0         0   -  /sys
tmpfs        tmpfs      128164         0    128164   0% /dev/shm
devpts      devpts           0         0         0   -  /dev/pts
/dev/hda2     vfat     4200800   2603096   1597704  62% /C
/sec.fs    reiser4     3892000   2367192   1524808  61% /alt
usbfs        usbfs           0         0         0   -  /proc/bus/usb
12:42 eax:~ > cat /proc/mounts 
rootfs / rootfs rw 0 0
/dev/root / reiserfs rw 0 0
proc /proc proc rw,nodiratime 0 0
sysfs /sys sysfs rw 0 0
devpts /dev/pts devpts rw 0 0
tmpfs /dev/shm tmpfs rw 0 0
/dev/hda2 /C vfat 
rw,nodiratime,uid=666,fmask=0077,dmask=0077,codepage=cp437,iocharset=iso8859-15,quiet,utf8 
0 0
/dev/loop0 /alt reiser4 rw,trace=0x0,log=0x0,debug=0x0,atom_max_size=0x3e94 0 
0
usbfs /proc/bus/usb usbfs rw 0 0

12:42 eax:~ > cat /etc/fstab
#!/bin/true
# DEVICE        MOUNTPOINT      FSTYPE  OPTIONS       DUMP  PASS#

/dev/hda1       /               reiserfs 
defaults,auto,acl,attrs,grpquota,usrquota,user_xattr 0 1
proc            /proc           proc    defaults,mask=0700,auto 0 0
/dev/hda2       /C              vfat    
defaults,auto,umask=0077,quiet,utf8,uid=666 0 0
/dev/hda3       swap            swap    defaults,auto 0 0
/sec.fs         /alt            reiser4 defaults,auto,loop 0 2
(shortened)

In the short period (about 4 hours) I disabled quota on the Reiser3 fs, the 
error did not pop up, but I'll leave quota deactivated a little longer to see 
how it develops.

>> Below clm-2100, I added a printk in the sources to see what's going on...:
>> (fs/reiserfs/journal.c)
>> 
>>             reiserfs_warning(p_s_sb, "clm-2100: nesting info a different FS");
>> +            printk(KERN_INFO "clm-2100+1: p_s_sb=%s (%p), t_super=%s (%p)\n",
>> +              reiserfs_bdevname(p_s_sb), p_s_sb,
>> +              reiserfs_bdevname(cur_th->t_super), cur_th->t_super
>> +            );
>> 
>> After I booted the newly compiled kernel with this printk, I even got a 
>> oops-or-similar when entering this branch, which "should never
>> ** really happen...". Wonder why?
>
>cur_th points not to struct reiserfs_transaction_handle, but to
>reiser4_context. 

Ouch, that should probably not happen, should it?



Jan Engelhardt
-- 
No TOFU for me, please.
