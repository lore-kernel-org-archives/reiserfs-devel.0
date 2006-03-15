From: Jeff Mahoney <jeffm@suse.com>
Subject: Static overrun in reiser3
Date: Wed, 15 Mar 2006 16:37:11 -0500
Message-ID: <44188907.50100@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28282-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hi Hans -

I've been playing around with the Coverity code checker, and while I
think it still sees a few too many false positives, it's a good tool.

Anyway, one of the potential bugs it came up with in reiserfs was this one:

struct tree_balance contains a number of arrays of size MAX_HEIGHT (5).
In fix_nodes(), line 2502, we see:
                        p_s_tb->insert_size[n_h + 1] =
                            (DC_SIZE + KEY_SIZE) * (p_s_tb->blknum[n_h]
- - 1);

I haven't run a thorough analysis, but is it possible for n_h to be 4
there, and then n_h + 1 would be 5, overrunning into the next field of
struct tree_balance? The tool seems to think so, but it also thought
that not checking that dentry->d_inode != NULL after calling
inode->i_op->mkdir was invalid, even though a successful return value
implies that dentry->d_inode != NULL.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFEGIkGLPWxlyuTD7IRAno5AJ92Qql/sMnii2Kk2VdFlLs/Hbpc3ACffcjT
qsw0pCCjm2DfeMA67n5sLu4=
=1bzF
-----END PGP SIGNATURE-----
