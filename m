From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiser4 and NFS
Date: Tue, 07 Sep 2004 18:00:46 +0400
Message-ID: <1094557437.1340.65.camel@tribesman.namesys.com>
References: <413C5DBA.1070207@fh-landshut.de>
	 <1094543842.1340.61.camel@tribesman.namesys.com>
	 <413D6BDC.80006@fh-landshut.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-nTTAGCkJEOzfqkJ0kBA/"
Return-path: <reiserfs-list-return-21570-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <413D6BDC.80006@fh-landshut.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oliver Korpilla <okorpil@fh-landshut.de>
Cc: reiserfs-list@namesys.com

--=-nTTAGCkJEOzfqkJ0kBA/
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Tue, 2004-09-07 at 12:05, Oliver Korpilla wrote:
> Hello Vladimir,
> 
> I guess not.
> 
> Both my clients are embedded systems, and both didn't work.
> 
> Client/Target one is a Motorola MVME2100 board with an MPC8240 PowerPC CPU @ 200
> MHz.
> 
> Client/Target two is a Motorola MVME5500 board with an MPC7455 PowerPC CPU @ 1GHz.
> 
> Both failed to mount their root filesystem via NFS from a Reiser4 on the
> server/host, but worked fine with an ext3 over NFS.
> 
> Either this is a NFSv3/Reiser4/2.6.8.1 server vs. NFSv3/2.4.21 client problem,
> or it has something to do with endianness (PowerPC is big-endian, Intel P4 box
> is little-endian). I know ext* has absolutely no issues with endianness, neither
> as RAM disk nor over NFS, but perhaps Reiser4 has?
> 
Yes, that could be a problem.
Would you please try to patch reiser4/vfs_ops.c with the attached patch
and let us know whether it makes any effect?


> Do both your client and your server have kernel 2.6.x? Are both Reiser4 patched?
> 
> Maybe Linux 2.6.x has new LOOKUP operation semantics in order to support Reiser4
> that Linux 2.4.2x hasn't?
> 
> On a side note:
> 
> It would be nice if we could reproduce the error, since I like Reiser4. I did a
> large egrep over the whole /usr subtree, and didn't hear a sound from my hard
> drive because accesses seemed to be well-ordered (no superfluous head
> movements). I first thought the operation failed. ;)
> 
> With kind regards,
> Oliver Korpilla
> 
> Vladimir Saveliev wrote:
> > I have no problems with exporting reiser4 via NFS. Could it be that you
> > have problem because your client is embedded?
> 
> 

--=-nTTAGCkJEOzfqkJ0kBA/
Content-Disposition: attachment; filename=vfs_ops.c.diff
Content-Type: text/plain; name=vfs_ops.c.diff; charset=
Content-Transfer-Encoding: 7bit

===== vfs_ops.c 1.732 vs edited =====
--- 1.732/vfs_ops.c	2004-08-30 17:05:53 +04:00
+++ edited/vfs_ops.c	2004-09-07 15:38:55 +04:00
@@ -1564,12 +1564,16 @@
 	addr = (char *)data;
 
 	need = encode_inode_size(inode);
-	if (need < 0)
+	if (need < 0) {
+		printk("reiser4_encode_fh-1: need=%d\n", need);
 		return NFSERROR;
+	}
 	if (need_parent) {
 		delta = encode_inode_size(parent);
-		if (delta < 0)
+		if (delta < 0) {
+			printk("reiser4_encode_fh-2: delta=%d\n", delta);
 			return NFSERROR;
+		}
 		need += delta;
 	}
 
@@ -1584,9 +1588,11 @@
 		 * handle. */
 		*lenp = (need + sizeof(__u32) - 1) >> 2;
 		result = need_parent ? FH_WITH_PARENT : FH_WITHOUT_PARENT;
-	} else
+	} else {
 		/* no enough space in file handle */
+		printk("reiser4_encode_fh-3: need=%d, lenp=%d\n", need, *lenp);
 		result = NFSERROR;
+	}
 	reiser4_exit_context(&context);
 	return result;
 }

--=-nTTAGCkJEOzfqkJ0kBA/--

