From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: un-long listable files
Date: Wed, 06 Aug 2003 14:06:52 -0400
Message-ID: <3F3143BC.9080602@suse.com>
References: <200308061431.13695.Michael.James@csiro.au> <20030806170346.GB14719@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15189-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030806170346.GB14719@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Michael.James@csiro.au, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Oleg Drokin wrote:
| Hello!
|
| On Wed, Aug 06, 2003 at 02:31:39PM +1000, Michael.James@csiro.au wrote:
|
|
|>getxattr("light_in_time_of_darkness__glad_to_see_you.wav",
|>         "system.posix_acl_access"
|>and there it sits waiting for heat-death-of-universe.
|
|
| Hm, this code is by SuSE people (and it is only in suse kernels) and I
have not
| even looked at it closely yet.
| Probably Jeff can comment on it.
|
|
|>Looks like I'm falling foul of some strange ACLs.
|>ls -l as root still hangs though.

Since you're mounted with "defaults", ACLs and user xattrs are disabled.
Both options need to be enabled explicitly. "Trusted" xattrs are enabled
by default, but they're root-only and I doubt they're in use.

The code path should go like so:
- - reiserfs_getxattr()
~  - reiserfs_xattr_read_lock()
~  - posix_acl_access_get()
~    - xattr_acl_get()
~      -- if !reiserfs_posixacl
~      -- return -EOPNOTSUPP
~  - reiserfs_xattr_read_unlock()

There's nothing in there that should be causing the behavior you're
seeing. However, I don't doubt that your session is hanging, so let's
try to figure out what's causing it.

What I'll need from you is a trace of the hung process. Enable alt+sysrq
(echo 1 > /proc/sys/kernel/sysrq), switch to a text console, and
generate a trace using alt+sysrq+t.

Next, decode the trace (dmesg | ksymoops), and email it to me. Hopefully
I'll be able to figure out what the problem is.

Thanks.

- -Jeff

- --
jeffm@suse.com
jeffm@csh.rit.edu
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQE/MUO7LPWxlyuTD7IRAsStAJ9J4q0qYAjJMO61vPufQbSxYrQ/qQCgi39F
c1/r/SarK3zTbn92i3AU/eM=
=4LoG
-----END PGP SIGNATURE-----

