From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: [PATCH] reiserfs:fix journaling issue regarding fsync()
Date: Fri, 23 Jun 2006 14:15:37 +0400
Message-ID: <1151057737.6355.28.camel@tribesman.namesys.com>
References: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-iVjx/2+sTkDRc0kEjsmG"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp>
Cc: reiser@namesys.com, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org


--=-iVjx/2+sTkDRc0kEjsmG
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

Sorry, but afaics reiserfs' fsync works as it is supposed to.
I experiment with the attached program. After reboot I make sure that
file has "new file size".

On Tue, 2006-06-20 at 17:43 +0900, Hisashi Hifumi wrote:
> Hi,
> 
>   When write() extends a file(i_size is increased) and fsync() is
> called, change of inode must be written to journaling area
> through fsync().
> But,currently the i_trans_id is not correctly updated when i_size
> is increased. So fsync() does not kick the journal writer.
> 
> Following patch fix this bug.
> 
>   Signed-off-by :Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp>
> 
> diff -Nru linux-2.6.17/fs/reiserfs/super.c linux-2.6.17_fix/fs/reiserfs/super.c
> --- linux-2.6.17/fs/reiserfs/super.c	2006-06-18 10:49:35.000000000 +0900
> +++ linux-2.6.17_fix/fs/reiserfs/super.c	2006-06-20 14:38:28.000000000 +0900
> @@ -558,6 +558,7 @@
>   		reiserfs_write_unlock(inode->i_sb);
>   		return;
>   	}
> +	reiserfs_update_inode_transaction(inode);
>   	reiserfs_update_sd(&th, inode);
>   	journal_end(&th, inode->i_sb, 1);
>   	reiserfs_write_unlock(inode->i_sb);
> 
> 
> Thanks, 
> 
> 

--=-iVjx/2+sTkDRc0kEjsmG
Content-Disposition: attachment; filename=stest.c
Content-Type: text/x-csrc; name=stest.c; charset=utf-8
Content-Transfer-Encoding: 7bit

#include <stdio.h>
#include <fcntl.h>
#include <sys/stat.h>

int main(int argc, char **argv)
{
	int fd;
	struct stat st;

	fd = open(argv[1], O_WRONLY | O_APPEND);
	if (fd == -1) {
		perror("open failed");
		return 0;
	}
	if (fstat(fd, &st)) {
		perror("stat failed");
		return 0;
	}
	printf("old file size %d\n", st.st_size);
	if (write(fd, "hello", 5) != 5) {
		perror("write failed");
		return 0;
	}

        if (fstat(fd, &st)) {
                perror("stat failed");
                return 0;
        }
        printf("new file size %d\n", st.st_size);
	if (fsync(fd)) {
		perror("fsync failed");
		return 0;
	}

	printf("rebooting"); fflush(stdout);
	system("reboot -f -n");
	return 0;
}

--=-iVjx/2+sTkDRc0kEjsmG--

