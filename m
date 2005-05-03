From: Jan Kara <jack@suse.cz>
Subject: Re: quota, reiserfs v3, 2.6.11.7
Date: Tue, 3 May 2005 15:00:43 +0200
Message-ID: <20050503130043.GD4501@atrey.karlin.mff.cuni.cz>
References: <20050502083334.GA19785@melkor.dnp.fmph.uniba.sk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Qxx1br4bt0+wmkIi"
Return-path: <reiserfs-list-return-23963-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050502083334.GA19785@melkor.dnp.fmph.uniba.sk>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Radovan Garabik <garabik@melkor.dnp.fmph.uniba.sk>
Cc: reiserfs-list@namesys.com

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hello,

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
  Hmm, grsecurity does not seem to modify anything that could influence
your problem. What I suspect more is that quota code trigges some rare
error path with a bug in it.

> I found these mesasges in syslog:
> May  2 07:36:30 palo kernel: ReiserFS: md0: warning: PAP-5660: reiserfs_do_truncate: wrong result -1 of search for [186288 279757 0xfffffffffffffff DIRECT]
  It would be useful if you can apply the attached patch to the kernel
so that when the above happens (which seems to be the first bug in a chain)
more debug info was dumped - at least we will know from where
reiserfs_do_truncate was called.

> May  2 07:36:30 palo kernel: ReiserFS: md0: warning: clm-2100: nesting info a different FS
> May  2 07:36:42 palo last message repeated 5 times
> 
> May  2 08:59:40 palo kernel: ReiserFS: md0: warning: PAP-5660: reiserfs_do_truncate: wrong result -1 of search for [221141 125166 0xfffffffffffffff DIRECT]
> May  2 08:59:40 palo kernel: ReiserFS: md0: warning: clm-2100: nesting info a different FS
> May  2 08:59:47 palo last message repeated 274 times
> 
> these two mesasges seem to correspond to the two crashes 
> 
> Unfortunately, since this is a production server, I cannot do many
> experiments, but I might try to set up reiserfs+quotas on some test
> computers if necessary.

						Thanks for report
									Honza

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="stree.c.diff"

--- linux/fs/reiserfs/stree.c	2005-03-03 18:58:30.000000000 +0100
+++ linux/fs/reiserfs/stree.c	2005-05-03 14:47:12.000000000 +0200
@@ -1790,7 +1790,7 @@ int reiserfs_do_truncate (struct reiserf
     if (retval == POSITION_FOUND || retval == FILE_NOT_FOUND) {
 	reiserfs_warning (p_s_inode->i_sb, "PAP-5660: reiserfs_do_truncate: "
 			  "wrong result %d of search for %K", retval, &s_item_key);
-
+	dump_stack();
         err = -EIO;
         goto out;
     }

--Qxx1br4bt0+wmkIi--
