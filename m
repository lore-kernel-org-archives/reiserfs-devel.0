From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: quota, reiserfs v3, 2.6.11.7
Date: Tue, 03 May 2005 18:41:22 +0400
Message-ID: <1115131282.17190.98.camel@tribesman.namesys.com>
References: <20050502083334.GA19785@melkor.dnp.fmph.uniba.sk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-X5h3vWOg9PU6SprxDa97"
Return-path: <reiserfs-list-return-23965-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050502083334.GA19785@melkor.dnp.fmph.uniba.sk>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Radovan Garabik <garabik@melkor.dnp.fmph.uniba.sk>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

--=-X5h3vWOg9PU6SprxDa97
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Mon, 2005-05-02 at 12:33, Radovan Garabik wrote:
> Hi all,
> 
> To add something to previous quota-related discussion:
> I have a server with 180GB reiserfs v3 filesystem on a software RAID-1, 
> 30GB of which is used, exported via nfs.
> Yesterday I turned quotas on (in order to calm down a new user eating
> approx. 1GB/day). Today in the morning the server was hung, I rebooted,
> worked for a few minutes before it hung again (with no message on the
> console). I rebooted again, turned quotas off, run reiserfsck 
> and the server is happily running for about 3 hours now, with heavy 
> nfs usage.
> 
> Kernel is vanilla 2.6.11.7 + grsecurity patches (could this be
> related?). Usually, the usage is rather heavy (/home nfs export to >15
> workstations).
> 
> I found these mesasges in syslog:
> May  2 07:36:30 palo kernel: ReiserFS: md0: warning: PAP-5660: reiserfs_do_truncate: wrong result -1 of search for [186288 279757 0xfffffffffffffff DIRECT]
> May  2 07:36:30 palo kernel: ReiserFS: md0: warning: clm-2100: nesting info a different FS
> May  2 07:36:42 palo last message repeated 5 times
> 
> May  2 08:59:40 palo kernel: ReiserFS: md0: warning: PAP-5660: reiserfs_do_truncate: wrong result -1 of search for [221141 125166 0xfffffffffffffff DIRECT]
> May  2 08:59:40 palo kernel: ReiserFS: md0: warning: clm-2100: nesting info a different FS
> May  2 08:59:47 palo last message repeated 274 times
> 
> these two mesasges seem to correspond to the two crashes 
> 

The attached patch should eliminate clm-2100. However, it is very likely
that PAP-5660 is caused by filesystem error. Would you mind to
reiserfsck?

> Unfortunately, since this is a production server, I cannot do many
> experiments, but I might try to set up reiserfs+quotas on some test
> computers if necessary.
> 
> Is anyone using similar setup? (reiserfs+quotas+2.6.11.7+nfs)
> 

--=-X5h3vWOg9PU6SprxDa97
Content-Disposition: attachment; filename=reiserfs-missing-journal_end.patch
Content-Type: text/plain; name=reiserfs-missing-journal_end.patch; charset=koi8-r
Content-Transfer-Encoding: 7bit


This patch adds missing journal_end when reiserfs_do_truncate returns error


 fs/reiserfs/inode.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletion(-)

diff -puN fs/reiserfs/inode.c~reiserfs-missing-journal_end fs/reiserfs/inode.c
--- linux-2.6.12-rc2-mm3/fs/reiserfs/inode.c~reiserfs-missing-journal_end	2005-05-03 18:34:35.253559838 +0400
+++ linux-2.6.12-rc2-mm3-vs/fs/reiserfs/inode.c	2005-05-03 18:35:57.484423915 +0400
@@ -46,6 +46,7 @@ void reiserfs_delete_inode (struct inode
 	reiserfs_update_inode_transaction(inode) ;
 
 	if (reiserfs_delete_object (&th, inode)) {
+	    journal_end(&th, inode->i_sb, jbegin_count);
 	    up (&inode->i_sem);
 	    goto out;
 	}
@@ -2017,8 +2018,10 @@ int reiserfs_truncate_file(struct inode 
 	       either appears truncated properly or not truncated at all */
 	add_save_link (&th, p_s_inode, 1);
     error = reiserfs_do_truncate (&th, p_s_inode, page, update_timestamps) ;
-    if (error)
+    if (error) {
+	journal_end (&th, p_s_inode->i_sb, JOURNAL_PER_BALANCE_CNT * 2 + 1);
         goto out;
+    }
     error = journal_end (&th, p_s_inode->i_sb, JOURNAL_PER_BALANCE_CNT * 2 + 1);
     if (error)
         goto out;

_

--=-X5h3vWOg9PU6SprxDa97--

