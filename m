From: "Charles P. Wright" <cwright@cs.sunysb.edu>
Subject: Re: Odd llseek semantics on directories
Date: Mon, 22 Aug 2005 13:12:43 -0400
Message-ID: <1124730763.30283.4.camel@polarbear.fsl.cs.sunysb.edu>
References: <1124722904.25421.11.camel@polarbear.fsl.cs.sunysb.edu>
	 <4309FB0C.9010409@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-2m2djqcU1uLIJaAB5HlO"
Return-path: <reiserfs-list-return-25611-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4309FB0C.9010409@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

--=-2m2djqcU1uLIJaAB5HlO
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Vladimir,

We actually came across this while working on Unionfs in the kernel,
which uses lseek to inquire about directory positions and then resume
directory reading operations (much like nfsd does).

I've attached a user space program that demonstrates the behavior.

The relevant strace entries are:
open("/mnt/r4/", O_RDONLY)              = 3
getdents(3, /* 5 entries */, 268)       = 80
lseek(3, 0, SEEK_CUR)                   = -1 ENOENT
lseek(3, 4294967295, SEEK_SET)          = -1 EINVAL

The third line is the one of concern.

The same program run on another file system yields a trace like:
open("/mnt", O_RDONLY)                  = 3
getdents(3, /* 4 entries */, 268)       = 68
lseek(3, 0, SEEK_CUR)                   = 2147483647
lseek(3, 2147483647, SEEK_SET)          = 2147483647

Charles

On Mon, 2005-08-22 at 20:19 +0400, Vladimir V. Saveliev wrote:
> Hello
> 
> Charles P. Wright wrote:
> > Hello,
> > 
> > I've noticed that Reiser4's behavior deviates from other file systems
> > when seeking with directories.  After reading a directory, if you run
> > vfs_lseek(dir, 0, SEEK_CUR), then -ENOENT is returned.   This means that
> > you can't pass the identifier back to vfs_lseek with SEEK_SET.
> > 
> Would you please send your test program?

--=-2m2djqcU1uLIJaAB5HlO
Content-Disposition: attachment; filename=getdents-reiserbug.c
Content-Type: text/x-csrc; name=getdents-reiserbug.c; charset=UTF-8
Content-Transfer-Encoding: 7bit

#include <stdio.h>
#include <linux/types.h>
#include <linux/unistd.h>
#include <linux/dirent.h>
#include <sys/types.h>
#include <fcntl.h>
#include <sys/errno.h>
#include <unistd.h>
#include <stdlib.h>

_syscall3(int, getdents, uint, fd, struct dirent *, dirp, uint, count);

int main(int argc, char *argv[])
{
	struct dirent dirent;
	int fd;
	int nread;
	struct dirent *p;
	off_t offset;

	if (argc != 2) {
		fprintf(stderr, "No dir specified\n");
		exit(1);
	}

	if ((fd = open(argv[1], O_RDONLY)) < 0) {
		fprintf(stderr, "Could not open directory %s\n", argv[1]);
		exit(2);
	}

	while ((nread = getdents(fd, &dirent, sizeof(dirent))) > 0) {
		p = &dirent;
		while (nread > 0) {
			printf("d_reclen = %d, d_name = %s, d_off = %lu\n", p->d_reclen, p->d_name, p->d_off);
			nread -= p->d_reclen;
			p = (struct dirent *)((char *)p + p->d_reclen);
		}
		offset = lseek(fd, 0, SEEK_CUR);
		printf("Offset is %llu\n", offset);
		if (lseek(fd, offset, SEEK_SET) < 0) {
			perror("lseek");
			exit(1);
		}
	}
	exit(0);
}

--=-2m2djqcU1uLIJaAB5HlO--

