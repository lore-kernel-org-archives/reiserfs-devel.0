From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 2/5] selinux: adds a private inode operation
Date: Mon, 22 Nov 2004 13:04:29 -0500
Message-ID: <41A22A2D.1000708@suse.com>
References: <20041121001318.GC979@locomotive.unixthugs.org> <1101145050.18273.68.camel@moss-spartans.epoch.ncsc.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22504-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1101145050.18273.68.camel@moss-spartans.epoch.ncsc.mil>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stephen Smalley <sds@epoch.ncsc.mil>
Cc: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Jeff Mahoney <jeffm@suse.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stephen Smalley wrote:
| On Sat, 2004-11-20 at 19:13, Jeffrey Mahoney wrote:
|
|>diff -ruNpX dontdiff linux-2.6.9/security/selinux/hooks.c
linux-2.6.9.selinux/security/selinux/hooks.c
|>--- linux-2.6.9/security/selinux/hooks.c	2004-11-19 14:40:58.000000000
- -0500
|>+++ linux-2.6.9.selinux/security/selinux/hooks.c	2004-11-20
17:11:22.000000000 -0500
|>@@ -740,6 +740,15 @@ static int inode_doinit_with_dentry(stru
|> 	if (isec->initialized)
|> 		goto out;
|>
|>+	if (opt_dentry && opt_dentry->d_parent &&
opt_dentry->d_parent->d_inode) {
|>+		struct inode_security_struct *pisec =
opt_dentry->d_parent->d_inode->i_security;
|>+		if (pisec->inherit) {
|>+			isec->sid = pisec->sid;
|>+			isec->initialized = 1;
|>+			goto out;
|>+		}
|>+	}
|>+
|> 	down(&isec->sem);
|> 	hold_sem = 1;
|> 	if (isec->initialized)
|
|
| Actually, isn't this code unnecessary given that patch 3/5 ensures that
| the selinux_inode_mark_private() hook is called from
| reiserfs_new_inode() on the new inode if the directory is private?  I
| think that eliminates the need to perform this test and inheritance in
| inode_doinit, which is called by the d_instantiate.
|

Yes, you're right. The isec->initialized check means that code never
gets executed.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBoiomLPWxlyuTD7IRAu3TAKCJK4LycKusauFJ/QPUIJSC3hqzaACgmsPD
Gte20LrcLzyB6Yjc83JJmr0=
=5sgF
-----END PGP SIGNATURE-----

-- 
Jeff Mahoney
SuSE Labs
