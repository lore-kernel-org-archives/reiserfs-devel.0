From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 2/5] selinux: adds a private inode operation
Date: Tue, 23 Nov 2004 14:27:12 -0500
Message-ID: <41A38F10.8000609@suse.com>
References: <20041121001318.GC979@locomotive.unixthugs.org> <1101145050.18273.68.camel@moss-spartans.epoch.ncsc.mil> <41A22A2D.1000708@suse.com> <1101148090.18273.94.camel@moss-spartans.epoch.ncsc.mil> <41A23922.80501@suse.com> <20041122123000.C14339@build.pdx.osdl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22538-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041122123000.C14339@build.pdx.osdl.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Wright <chrisw@osdl.org>
Cc: Stephen Smalley <sds@epoch.ncsc.mil>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, James Morris <jmorris@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chris Wright wrote:
| * Jeff Mahoney (jeffm@suse.com) wrote:
|
|>Excellent. Thanks. Preliminary testing works as expected (ie: deadlocks
|>don't occur, xattrs/<dir> is removed when owning file is deleted)
|>
|>I've integrated the changes into my patch set. With those issues
|>addressed, would you feel these would be appropriate for inclusion? I
|>suspect you may have gotten questions as many interested parties in this
|>feature working as I have.
|
|
| Why add extra hook, when this could be done in VFS with i_flags?

Sure, it could be done w/ an i_flags bit. However, since it's explicitly
related to the security infrastructure, I think it's more appropriate
there. There's no change in the size of inode_security_struct, and the
addition of the deref is trivial given how many other places in the
file-io path use the same call table. That said, I'll change it to use
whatever ends up being agreed upon. I'm just looking to get selinux to
not call xattr routines on reiserfs-internal files/directories.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBo48QLPWxlyuTD7IRAiIlAJ9wN7JPywCVz/UVJ1dVTM1kQphPRQCgoK8J
TMDL9KrBABk49cbfN7AcoOA=
=6RPR
-----END PGP SIGNATURE-----
