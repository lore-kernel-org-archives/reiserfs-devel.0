From: Domenico Andreoli <cavok@tiscali.it>
Subject: Re: reiserfsprogs 3.6.16 release
Date: Fri, 14 May 2004 00:11:53 +0200
Sender: Domenico Andreoli <cavok@libero.it>
Message-ID: <20040513221153.GA11191@raptus.homelinux.org>
References: <200405132235.15380.vitaly@namesys.com> <20040513203526.GA2007@raptus.homelinux.org> <200405140045.45433.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18664-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200405140045.45433.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Fri, May 14, 2004 at 12:45:45AM +0400, Vitaly Fertman wrote:
> On Friday 14 May 2004 00:35, Domenico Andreoli wrote:
> > On Thu, May 13, 2004 at 10:35:15PM +0400, Vitaly Fertman wrote:
> >
> > > - the bugfix for dynamically linking to be 'position independent' code.
> >
> > is this the story of [0] and more recent debian bug #230482 [1]? this
> > would mean debian does not need to distribute reiserfsck statically
> > linked any more, does it?
> 
> right, this problem should not appear anymore.
> 
fine, great job! :)

bts, it looks some define is missing here and there...

...
misc.c: In function `get_dma_support':
misc.c:682: warning: implicit declaration of function `IDE_DISK_MAJOR'
...
reiserfslib.c: In function `can_we_format_it':
reiserfslib.c:1216: warning: implicit declaration of function `IDE_DISK_MAJOR'
reiserfslib.c:1217: warning: implicit declaration of function `SCSI_BLK_MAJOR'
...
gcc  -g -Wall -O2 -fPIC -DPIC   -o reiserfsck  main.o pass0.o pass1.o
pass2.o semantic_check.o semantic_rebuild.o pass4.o lost+found.o
ubitmap.o uobjectid.o ustree.o ufile.o check_tree.o info.o super.o
../lib/libmisc.a ../reiserfscore/libcore.a -luuid 
../lib/libmisc.a(misc.o)(.text+0x13ec): In function `get_dma_support':
/home/cavok/archive/debian_working/reiserfsprogs/reiserfsprogs-3.6.16/lib/misc.c:682: undefined reference to `IDE_DISK_MAJOR'
../reiserfscore/libcore.a(reiserfslib.o)(.text+0x2769): In function `can_we_format_it':
/home/cavok/archive/debian_working/reiserfsprogs/reiserfsprogs-3.6.16/reiserfscore/reiserfslib.c:1216: undefined reference to `IDE_DISK_MAJOR'
../reiserfscore/libcore.a(reiserfslib.o)(.text+0x277b):/home/cavok/archive/debian_working/reiserfsprogs/reiserfsprogs-3.6.16/reiserfscore/reiserfslib.c:1216: undefined reference to `SCSI_BLK_MAJOR'
collect2: ld returned 1 exit status
...

cheers
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
