From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Files > 2GB and 3.6 version (after converting from 3.5)
Date: Tue, 19 Sep 2006 01:16:24 +0400
Message-ID: <200609190116.24775.vs@namesys.com>
References: <1156.192.168.0.1.1158409502.squirrel@www.bluenet.waw.pl> <200609172324.10289.vs@namesys.com> <4569.192.168.0.1.1158528028.squirrel@www.bluenet.waw.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29931-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4569.192.168.0.1.1158528028.squirrel@www.bluenet.waw.pl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pjagoda@bluenet.waw.pl
Cc: reiserfs-list@namesys.com

Hello

On Monday 18 September 2006 01:20, Pawel Jagoda wrote:
> > Hello
> >
> > On Saturday 16 September 2006 16:25, Pawel Jagoda wrote:
> >> Hello.
> >>
> >> I've backup my data - one file, which have 4060 MB. Unfortunetly I
> >> didn't
> >> point out that my destination file system is in old 3.5.x version. And
> >> of
> >> course I cannot read my data after 2GB (it says: Input/Output Error). I
> >> have converted my filesystem into 3.6.x, but still I'm not able to read
> >> this file. But if I create new file (for example: dd if=/dev/zero
> >> of=/mnt/hda3/some_file bs=1M count=3000), there is no problem to read
> >> it.
> >> Is it possible, to do something to restore my backup from this file? If
> >> yes, then how can I do it?
> >>
> >
> > Which kernel did you use?
> >
> 
> 2.6.14.7
> 
> 

Please try whether the attached patch helps.


diff -puN fs/reiserfs/inode.c~reiserfs-debug-read fs/reiserfs/inode.c



diff -puN fs/reiserfs/inode.c~reiserfs-read-4gb-files fs/reiserfs/inode.c
--- linux-2.6.14.7/fs/reiserfs/inode.c~reiserfs-read-4gb-files	2006-09-19 01:41:46.000000000 +0400
+++ linux-2.6.14.7-vs/fs/reiserfs/inode.c	2006-09-19 01:41:46.000000000 +0400
@@ -206,7 +206,7 @@ static inline void set_block_dev_mapped(
 static int file_capable(struct inode *inode, long block)
 {
 	if (get_inode_item_key_version(inode) != KEY_FORMAT_3_5 ||	// it is new file.
-	    block < (1 << (31 - inode->i_sb->s_blocksize_bits)))	// old file, but 'block' is inside of 2gb
+	    block < (1 << (32 - inode->i_sb->s_blocksize_bits)))	// old file, but 'block' is inside of 2gb
 		return 1;
 
 	return 0;

_
