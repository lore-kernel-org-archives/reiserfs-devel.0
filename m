From: Chris Mason <mason@suse.com>
Subject: Re: Very very slow rm/unlink of large sparse files
Date: Mon, 16 Feb 2004 09:29:08 -0500
Message-ID: <1076941748.2482.1249.camel@watt.suse.com>
References: <4030391F.5080204@lig.net>
	 <200402161432.35178.Dieter.Nuetzel@hamburg.de>
	 <1076938953.2482.1246.camel@watt.suse.com>
	 <200402161506.51895.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16805-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402161506.51895.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list@namesys.com, "Stephen D. Williams" <sdw@lig.net>

On Mon, 2004-02-16 at 09:06, Dieter N=FCtzel wrote:

> INSTALL/SOURCE> time rm sparse
> 0.000u 10.684s 2:15.11 7.9%     0+0k 0+0io 0pf+0w
>=20
> 'rm' time is lost in 'io_schedule' and 'down'.

Dieter, could you please try with this (shamefully untested and
uncompiled) patch:

--- linux.test/fs/reiserfs/stree.c.1	2004-02-16 09:26:33.643567752 -0500
+++ linux.test/fs/reiserfs/stree.c	2004-02-16 09:27:24.166887040 -0500
@@ -1754,7 +1754,7 @@
 	  reiserfs_update_sd(th, p_s_inode) ;
=20
 	  journal_end(th, p_s_inode->i_sb, orig_len_alloc) ;
-	  journal_begin(th, p_s_inode->i_sb, orig_len_alloc) ;
+	  journal_begin(th, p_s_inode->i_sb, JOURNAL_PER_BALANCE_CNT * 5) ;
 	  reiserfs_update_inode_transaction(p_s_inode) ;
 	}
     } while ( n_file_size > ROUND_UP (n_new_file_size) &&


