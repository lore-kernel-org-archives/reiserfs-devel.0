From: Hans Reiser <reiser@namesys.com>
Subject: Re: production use of reiserfs
Date: Thu, 27 Nov 2003 21:22:24 -0800
Message-ID: <3FC6DB90.7080408@namesys.com>
References: <200311280846.12697.ivan@t1.unisoftbg.com>	<16327.6650.487369.786012@laputa.namesys.com>	<200311281242.18139.ivan@t1.unisoftbg.com> <16327.13886.709901.444317@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16179-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16327.13886.709901.444317@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: ivan <ivan@t1.unisoftbg.com>, reiserfs-list@namesys.com

Nikita Danilov wrote:

>ivan writes:
> > Hi ,
> > Thanks for the answer!.
> > 
> > It is the info.
> > I hope it is all that I have.
> > And it is from the last crashed system.
> > 
> > /etc/fstat:
> > 
> > /dev/hda2               /                       reiserfs defaults        1 1
> > /dev/hda1               /boot                   reiserfs defaults        1 2
> > none                    /dev/pts                devpts  gid=5,mode=620  0 0
> > none                    /proc                   proc    defaults        0 0
> > none                    /dev/shm                tmpfs   defaults        0 0
> > /dev/hda3               swap                    swap    defaults        0 0
> > /dev/hdc2               /mnt/diske              reiserfs defaults        1 2
> > 
> > 
> > 
> > [root@tp1 root]# dmesg
> > Linux version 2.4.20-8 (bhcompile@porky.devel.redhat.com) (gcc version 3.2.2 
> > 20030222 (Red Hat Linux 3.2.2-5)) #1 Thu Mar 13 17:54:28 EST 2003
> > BIOS-provided physical RAM map:
>
>We need kernel messages issued during crash. It is possible (albeit not
>necessary) that they managed to get into /var/log/messages, if crashes
>are severe enough you will have to compile serial console support into
>kernel, attach null-modem to the serial port of the target machine and
>run something similar to minicom(1) on the other end to collect kernel
>messages during crash.
>
> >  BIOS-e820: 0000000000000000 - 00000000000a0000 (usable)
> >  BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
>
>[...]
>
> > >  > Also it is possible to use redhat AS 3.0, but we do not find any info
> > >  > how to instsall it with reiserfs. Exist any problems on this distro?
> > >
> > > It is much easier for us to track and deal with problems in the stock
> > > kernel, but look at the http://www.namesys.com/support.html :)
> > 
> > I readet it, but it is for problems.
> > I can not figure exactly my problem.
> > It is not one time crash.
>
>Yes, I meant money can buy you better support. :)
>
> > 
> > I am searching info to know if reiserfs is production ready.
>
>People are using it successfully. It is standard file system in some
>distributions. It has been used on some very large highly loaded
>servers.
>
> > And also to know if exists any problems in redhat implementation for reiserfs.
>
>That's hard to tell, because we don't know whether redhat modified
>reiserfs code in any way. What you can do is to download 2.4.20 kernel
>from kernel.org and do "diff -rup" between /usr/src/linux/fs/reiserfs
>and /stock-2.4.20-kernel/fs/reiserfs.
>  
>
this is not likely to show any differences, sources of bugs are likely 
to be outside reiserfs.

I can tell you that I don't particularly trust reiserfs on redhat 
kernels because they don't apply reiserfs bug fix patches and generally 
don't mind breaking reiserfs.  Please download  the latest official 
kernel if you want to be sure to have all bugfixes we have made.  The 
latest official kernel is very solid for reiserfs, as is the suse kernel 
(excepting the extended attributes patch SuSE wrote which you can 
disable in the kernel configuration).  This particular kernel you have 
might be reasonably stable because 2.4.20 was reasonably stable for us, 
but as I said the latest official kernel generates no bug reports on 
filesystems created from scratch on it.   We would investigate and fix 
your bug report for free except that RedHat will not apply it if we 
generate a patch, so we would only do it for a fee.

> > 
> > >
>
>Nikita.
>
> > 
> > regards,
> > ivan.
>
>
>  
>


-- 
Hans


