From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Lost ACL
Date: Fri, 13 Feb 2004 13:44:54 -0500
Message-ID: <402D1B26.3040009@suse.com>
References: <402CE469.4010809@gbf.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16787-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <402CE469.4010809@gbf.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joachim Reichelt <Reichelt@gbf.de>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Joachim Reichelt wrote:
| Dear all,
|
| on SuSE 8.1 we have a fileserver with acl's on 500GB on a hardware raid.
| Now we had to powerdown the system. The controler seems to have not
| properly written all data to disk. So i had to do a
| reiserfsck --fix-fixable /dev/sda8
|
| This did nearly the whole job, but left me with a tree
| ./.reiserfs_privat/xattr/ (size of dir is ~38MB)
| The files thereis seems to be two hex numbers seperated by a dot e.g.
| 12E63C.24C58
| and no acl.
| What can I do to get acl back?
|

The .reiserfs_priv/xattr hierarchy is how my xattr/acl code stores the
ACLs without a disk format change. The hex numbers are
<objectid>.<generation number>, and then the individual xattrs are
stored inside that directory with their name as the filenames.

This directory is hidden (and used to find ACLs) when ACLs or xattrs are
enabled. Is your filesystem mounted with -oacl?

- -Jeff

- --
Jeff Mahoney
SuSE Labs
jeffm@suse.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFALRslLPWxlyuTD7IRApbCAJ9f3B9rMpyv0Q56SRsMWsWuyTBA8ACgk6Uc
wp668pLEYc8+fFvKFqzJ27M=
=nqru
-----END PGP SIGNATURE-----
