From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Lost ACL
Date: Fri, 13 Feb 2004 15:47:49 -0500
Message-ID: <402D37F5.9040008@suse.com>
References: <402CE469.4010809@gbf.de>	<402D1B26.3040009@suse.com> <16429.7163.319615.173151@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16789-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16429.7163.319615.173151@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Joachim Reichelt <Reichelt@gbf.de>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Nikita Danilov wrote:
|  > The .reiserfs_priv/xattr hierarchy is how my xattr/acl code stores the
|  > ACLs without a disk format change. The hex numbers are
|  > <objectid>.<generation number>, and then the individual xattrs are
|  > stored inside that directory with their name as the filenames.
|  >
|  > This directory is hidden (and used to find ACLs) when ACLs or
xattrs are
|  > enabled. Is your filesystem mounted with -oacl?
|
| As Vladimir suggested, it may be fsck that "restored" .reiserfs_priv and
| made it visible.

No, the fact that it may have been "restored" is irrelevant. The
.reiserfs_priv directory doesn't employ reiserfs hidden directory
entries - it's hidden by loading the directory entry at filesystem
mount, and then poisoning the results of reiserfs_lookup() and
reiserfs_readdir().

- -Jeff

- --
Jeff Mahoney
SuSE Labs
jeffm@suse.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFALTf1LPWxlyuTD7IRAv/XAJ474Bpj9DuSXAQy2lAbB/e30ZXEHgCeO8u3
DkP+rb7X9c5nRBJPS1DUOd4=
=EdYz
-----END PGP SIGNATURE-----
