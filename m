From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: XATTR bugs
Date: Tue, 09 Dec 2003 18:31:35 -0500
Message-ID: <3FD65B57.8040603@suse.com>
References: <16323.62343.428966.858580@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16307-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16323.62343.428966.858580@pc7.dolda2000.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fredrik Tolf <fredrik@dolda2000.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Fredrik Tolf wrote:
| Hi!
|
| I just applied the ReiserFS xattr patches to my 2.6.0-test10 Linux
| kernel, and I found what appears to be two bugs.
|
| The patches were those from
| ftp://ftp.suse.com/pub/people/jeffm/reiserfs/aclea/
|
| Since there is no mention of this URL on the namesys.com home page, I
| don't know if these patches are "official". If they aren't, please
| tell me so and I will turn elsewhere, and if you know where to mail it
| instead, please tell me that too.
|
| Anyway, I'm going to ramble on as if they were official.

As much as I'd like them to see "official" testing, Hans is very much
against these patches against a V3 filesystem.

I've just posted updates to the patches on my (the above) FTP site.

| The first bug was in inode.c and was really simple. The only thing was
| that #include <linux/quotaops.h> was missing. It is necessary for
| DQUOT_TRANSFER, which is used by the xattr patch, and as such the
| module won't load.

This bug was fixed in the updated patches.

| The second one was a bit more subtle. I'm using this ReiserFS to serve
| NFS, and I discovered that there was an ACL-related bug in
| reiserfs_setattr (also from inode.c). In the end of that function
| (line 2464 in my kernel), it makes a call to reiserfs_acl_chmod, like
| this:
[...]
| The thing is that I don't know ReiserFS, and so I don't really know
| what I'm doing. If you think this breaks anything, please tell me
| so. In any other case, I guess it would be a good thing to change the
| patches into this.

This bug, however, I don't believe is a bug in my code. This code works
fine on 2.4 kernels, and after a few minutes of searching, I've found
the difference.

This follows behavior on ext[23], which is part of the "official" 2.6
kernel. The reason for this is as follows:

fs/nfsd/vfs.c:nfsd_setattr() is responsible for NFS server setattr()
behavior on both 2.4 and 2.6 kernels.
The following chunk of code handles the chmod:
~        if (!check_guard || guardtime == inode->i_ctime) {
~                err = notify_change(dentry, iap);
~                err = nfserrno(err);
~        }

The culprit as to why you're seeing this behavior is in nfserrno().

On v2.4 kernels, the structure that handles the error mapping ends like
this:
~                { nfserr_stale, -ESTALE },
~                { nfserr_dropit, -ENOMEM },
~                { nfserr_notsupp, -EOPNOTSUPP },
~                { nfserr_notsupp, -ENOTSUPP },
~                { -1, -EIO }

On v2.6 kernels, the structure that handles the error mapping ends like
this:
~                { nfserr_stale, -ESTALE },
~                { nfserr_dropit, -EAGAIN },
~                { nfserr_dropit, -ENOMEM },
~                { -1, -EIO }

... thus the -EOPNOTSUPP isn't mapped to a non-fatal error, and defaults
to -EIO.

The problem needs to be addressed there, not in the ReiserFS code. I'll
check out when and why that bit of code became errnoneous in the 2.6
kernel later this evening; I'm headed out the door at the moment.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
jeffm@suse.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQE/1ltXLPWxlyuTD7IRAtJ7AJ9W4anIDLlZB62cF4s62btfXdiVNACdEgh3
a/kF/6BytHVd4fOBr3VoY4o=
=ZInn
-----END PGP SIGNATURE-----
