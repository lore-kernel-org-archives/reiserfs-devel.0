From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: fix double-lock while chowning setuid file
 w/ xattrs
Date: Tue, 27 Nov 2012 10:13:48 -0500
Message-ID: <50B4D8AC.3050105@suse.com>
References: <50B382E5.1010300@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <50B382E5.1010300@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11/26/12 9:55 AM, Jeff Mahoney wrote:
> reiserfs_chown_xattrs() takes the iattr struct passed into
> ->setattr and uses it to iterate over all the attrs associated with
> a file to change ownership of xattrs (and transfer quota associated
> with the xattr files).
> 
> When a setuid file is chowned and the setuid bit is cleared,
> reiserfs_setattr gets called with both ATTR_MODE and ATTR_UID set.
> Since ATTR_MODE causes the ACL chmod code to be invoked, we end up
> calling reiserfs_acl_chmod on the xattr file. There's a missing
> IS_PRIVATE check there, so instead of bailing out immediately, we
> end up taking the inode->i_mutex a second time in open_xa_dir.
> 
> The other xattr paths are protected against similar situations by
> bailing out on IS_PRIVATE. This patch adds the missing check to
> reiserfs_acl_chmod.
> 
> Signed-off-by: Jeff Mahoney <jeffm@suse.com> Cc: stable@kernel.org 
> --- fs/reiserfs/xattr_acl.c |    3 +++ 1 file changed, 3
> insertions(+)
> 
> --- a/fs/reiserfs/xattr_acl.c +++ b/fs/reiserfs/xattr_acl.c @@
> -448,6 +448,9 @@ int reiserfs_acl_chmod(struct inode *ino struct
> posix_acl *acl, *clone; int error;
> 
> +	if (IS_PRIVATE(inode)) +		return 0; + if
> (S_ISLNK(inode->i_mode)) return -EOPNOTSUPP;
> 

Ignore this patch. It's incomplete. It avoids the double lock, but
ATTR_MODE is applied to the directory as well.

- -Jeff


- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.18 (Darwin)
Comment: GPGTools - http://gpgtools.org
Comment: Using GnuPG with undefined - http://www.enigmail.net/

iQIcBAEBAgAGBQJQtNisAAoJEB57S2MheeWy3DEQAL1SfWVnMaQALEkZ7RfM3wIx
vGMkfh2kn58ZSFlpmP3dWukeSHqBQgd5N2YZbAmW51Z9peHphBe3ntyEd1Bj1qQM
RSF35EBD7UP1QtrxfwMmva1huzp7iwYCAfR7RN/QQbtNUc4ppD7CrPKIhiczmeAI
YJ+uGHZPyM6B1lRb27Vb9wPSf/TsPZ7id8dTmDMkUjLTGAQeNT7L/Eo9hiM9TK+4
mkdNspJXRZh/iIHcSOcrURdeuMhRm/KEG2G8er1LaYzP2j0y/RI1bygsWLVHfUzt
PyMcESs06R1h3vVYFDEGj2J3Nx8Z2nBHsvPt3CleRJkKdX7cZVIUIE/Eb3wFY1Hz
BrDcLHm0/jC+dw20l+ohdWDsqOf32ZxC6X6e4GP5JeKKDdtLBEkgzQDV0I9kMDiy
XQFAR6gi4ieuHTIddYWZ2KvY6ZXIN1uPEZtrjZE39mRP9/HZbf4vo5dzLgo3yCUT
5RGx0hE2HBz5xZFNe66vID+JP7TdOTUe2OUeD8pBbjiY/CiM9N8UroIN672Lsm82
FEvQ+sn2tMziVy9TfCaqq2WkEopecKCjL6HkwSf3sylCfnR2kDihA1g/ClVlhoGk
IXFir/N/aOczNuZpCQgnE+THeHAMYD3DdQmYTVqng/YgIq5pa9KSX2+VpUQP3VY0
jiLiQWm9C1JNg6MN57qV
=oSqU
-----END PGP SIGNATURE-----
