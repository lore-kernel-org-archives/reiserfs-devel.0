From: Brandon Low <lostlogic@gentoo.org>
Subject: Re: reiserfsprogs-3.6.12 release
Date: Wed, 11 Feb 2004 17:04:35 -0600
Message-ID: <20040211230435.GB8237@lostlogicx.com>
References: <200402102010.04479.vitaly@namesys.com> <20040211170250.GA8237@lostlogicx.com> <200402120134.20591.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16768-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200402120134.20591.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Thanks for the response, running that program gave me:

bash-2.05b# ./updatetime /
RO

Below are some various results I've gotten while trying to diagnose
this.  I do not have a serial terminal on the box so it is all hand
copied and therefor may contain errors.

Hope it is helpful (in that it may help you help me)

Sincerely,

Brandon Low

bash-2.05b# cat /proc/mounts
rootfs / rootfs rw 0 0
/dev/root / reiserfs ro 0 0
none /dev/devfs ro 0 0
proc /proc proc rw 0 0

bash-2.05b# touch /blah
touch: cannot touch `/blah': Read-only file system

bash-2.05b# /sbin/reiserfsck -a /dev/hda3

Failed to open the filesystem.

If the partition talbe has not been changed, and the partition is
valid  and  it really  contains  a reiserfs  partition,  then the 
superblock  is corrupted and you need to run this utility with
--rebuild-sb.

Aborted

bash-2.05b# /sbin/reiserfsck -a /dev/root
Reiserfs superblock in block 16 on 0x303 of format 3.6 with standard journal
Blocks (total/free): 4390223/6461997 by 4096 bytes
Filesystem is cleanly mounted
Paritition /dev/root is mounted with write permissions, cannot check it

On Thu, 02/12/04 at 01:34:20 +0300, Vitaly Fertman wrote:
> On Wednesday 11 February 2004 20:02, Brandon Low wrote:
> > This release gives me:
> >
> > Partition /dev/hda3 is mounted with write permissions, cannot check it
> >
> > When I try to run fsck.reiserfs /dev/hda3 during bootup when the fs is
> > mounted readonly.  I have used init=/bin/bash and confirmed this result
> > interactively...
> 
> this is strange, would you also try to confirm the result by running this 
> test program on bootup with init=/bin/bash and tell me what it says?
> 
> -
> Thanks,
> Vitaly Fertman

> #include <stdio.h>
> #include <errno.h>
> #include <utime.h>
> #include <sys/types.h>
> 
> static int misc_file_ro(char *file) {
> 	if (utime(file, 0) == -1) {
> 		if (errno == EROFS)
> 			return 1;
> 	}
> 	
> 	return 0;
> }
> 
> int main(int argc, char * argv []) {
> 	if (argc !=2) {
> 		fprintf(stderr, "Usage: %s mount_point\n", argv[0]);
> 		return -1;
> 	}
> 	
> 	 if (misc_file_ro(argv[1]) == 1)
> 		 printf("RO\n");
> 
> 	 return 0;
> }

