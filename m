From: "Charles P. Wright" <cwright@cs.sunysb.edu>
Subject: Re: Odd llseek semantics on directories
Date: Sat, 27 Aug 2005 10:36:46 -0400
Message-ID: <1125153406.19560.0.camel@localhost.localdomain>
References: <1124722904.25421.11.camel@polarbear.fsl.cs.sunysb.edu>
	 <4309FB0C.9010409@namesys.com>
	 <1124730763.30283.4.camel@polarbear.fsl.cs.sunysb.edu>
	 <430B114F.9050200@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25659-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <430B114F.9050200@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

Vladimir,

This patch fixes the issue.

Thanks,
Charles

On Tue, 2005-08-23 at 16:06 +0400, Vladimir V. Saveliev wrote:
> Hello
> 
> Charles P. Wright wrote:
> > Vladimir,
> > 
> > We actually came across this while working on Unionfs in the kernel,
> > which uses lseek to inquire about directory positions and then resume
> > directory reading operations (much like nfsd does).
> > 
> 
> Ok, please try whether the attached patch makes reiser4 to behave similar to others.
> 
> 
> > I've attached a user space program that demonstrates the behavior.
> > 
> > The relevant strace entries are:
> > open("/mnt/r4/", O_RDONLY)              = 3
> > getdents(3, /* 5 entries */, 268)       = 80
> > lseek(3, 0, SEEK_CUR)                   = -1 ENOENT
> > lseek(3, 4294967295, SEEK_SET)          = -1 EINVAL
> > 
> > The third line is the one of concern.
> > 
> > The same program run on another file system yields a trace like:
> > open("/mnt", O_RDONLY)                  = 3
> > getdents(3, /* 4 entries */, 268)       = 68
> > lseek(3, 0, SEEK_CUR)                   = 2147483647
> > lseek(3, 2147483647, SEEK_SET)          = 2147483647
> > 
> > Charles
> > 
> > On Mon, 2005-08-22 at 20:19 +0400, Vladimir V. Saveliev wrote:
> >>Hello
> >>
> >>Charles P. Wright wrote:
> >>>Hello,
> >>>
> >>>I've noticed that Reiser4's behavior deviates from other file systems
> >>>when seeking with directories.  After reading a directory, if you run
> >>>vfs_lseek(dir, 0, SEEK_CUR), then -ENOENT is returned.   This means that
> >>>you can't pass the identifier back to vfs_lseek with SEEK_SET.
> >>>
> >>Would you please send your test program?
> >>
> >>------------------------------------------------------------------------
> >>
> >>#include <stdio.h>
> >>#include <linux/types.h>
> >>#include <linux/unistd.h>
> >>#include <linux/dirent.h>
> >>#include <sys/types.h>
> >>#include <fcntl.h>
> >>#include <sys/errno.h>
> >>#include <unistd.h>
> >>#include <stdlib.h>
> >>
> >>_syscall3(int, getdents, uint, fd, struct dirent *, dirp, uint, count);
> >>
> >>int main(int argc, char *argv[])
> >>{
> >>	struct dirent dirent;
> >>	int fd;
> >>	int nread;
> >>	struct dirent *p;
> >>	off_t offset;
> >>
> >>	if (argc != 2) {
> >>		fprintf(stderr, "No dir specified\n");
> >>		exit(1);
> >>	}
> >>
> >>	if ((fd = open(argv[1], O_RDONLY)) < 0) {
> >>		fprintf(stderr, "Could not open directory %s\n", argv[1]);
> >>		exit(2);
> >>	}
> >>
> >>	while ((nread = getdents(fd, &dirent, sizeof(dirent))) > 0) {
> >>		p = &dirent;
> >>		while (nread > 0) {
> >>			printf("d_reclen = %d, d_name = %s, d_off = %lu\n", p->d_reclen, p->d_name, p->d_off);
> >>			nread -= p->d_reclen;
> >>			p = (struct dirent *)((char *)p + p->d_reclen);
> >>		}
> >>		offset = lseek(fd, 0, SEEK_CUR);
> >>		printf("Offset is %llu\n", offset);
> 
> offset is off_t. off_t is long int in this program.
> You should have therefore
> printf("Offset is %ld\n", offset);
> 
> >>		if (lseek(fd, offset, SEEK_SET) < 0) {
> >>			perror("lseek");
> >>			exit(1);
> >>		}
> >>	}
> >>	exit(0);
> >>}
> 
> plain text document attachment (reiser4-fix-llseek.patch)
> This patch changes lseek part the end of reiser4 directory to not return ENOENT.
> 
> 
>  fs/reiser4/plugin/dir/dir.c |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff -puN fs/reiser4/plugin/dir/dir.c~reiser4-fix-llseek fs/reiser4/plugin/dir/dir.c
> --- linux-2.6.12-rc6-mm1/fs/reiser4/plugin/dir/dir.c~reiser4-fix-llseek	2005-08-23 15:22:43.363256896 +0400
> +++ linux-2.6.12-rc6-mm1-vs/fs/reiser4/plugin/dir/dir.c	2005-08-23 15:59:29.523105778 +0400
> @@ -854,7 +854,10 @@ dir_rewind(struct file *dir, readdir_pos
>  		memset(pos, 0, sizeof *pos);
>  		return dir_go_to(dir, pos, tap);
>  	} else if (destination >= inode->i_size)
> -		return RETERR(-ENOENT);
> +		/* seek past the end of directory */
> +		dir->f_pos = inode->i_size;
> +		return 0;
> +	}
>  
>  	if (shift < 0) {
>  		/* I am afraid of negative numbers */
> @@ -1629,7 +1632,7 @@ readdir_common(struct file *f /* directo
>  
>   repeat:
>  	result = dir_readdir_init(f, &tap, &pos);
> -	if (result == 0) {
> +	if (result == 0 && f->f_pos != inode->i_size) {
>  		result = tap_load(&tap);
>  		/* scan entries one by one feeding them to @filld */
>  		while (result == 0) {
> @@ -1669,7 +1672,7 @@ readdir_common(struct file *f /* directo
>  
>  		if (result >= 0)
>  			f->f_version = inode->i_version;
> -	} else if (result == -E_NO_NEIGHBOR || result == -ENOENT)
> +	} else if (result == -E_NO_NEIGHBOR || f->f_pos == inode->i_size || result == -ENOENT)
>  		result = 0;
>  	tap_done(&tap);
>  	detach_fsdata(f);
> 
> _

