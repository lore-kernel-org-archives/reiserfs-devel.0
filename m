From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 3/4] reiserfs: fixup perms when xattrs are disabled
Date: Sun, 10 May 2009 19:28:14 -0400
Message-ID: <4A07630E.8000503@suse.com>
References: <20090510200535.893737918@suse.com> <20090510200649.900586983@suse.com> <20090510213518.GG8633@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090510213518.GG8633@ZenIV.linux.org.uk>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Al Viro <viro@ftp.linux.org.uk>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, stefanr@s5r6.in-berlin.de

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Al Viro wrote:
> On Sun, May 10, 2009 at 04:05:38PM -0400, Jeff Mahoney wrote:
> 
>> +#ifdef CONFIG_REISERFS_FS_XATTR
>> +	/*
>> +	 * Stat data v1 doesn't support ACLs.
>> +	 */
>> +	if (get_inode_sd_version(inode) != STAT_DATA_V1)
>> +		return generic_permission(inode, mask, reiserfs_check_acl);
>> +	else
>> +#endif
>> +		return generic_permission(inode, mask, NULL);
> 
> Matter of style: this kind of mixing the nesting structures is Not Nice(tm),
> so I'd rather turn that into
> 
> +#ifdef CONFIG_REISERFS_FS_XATTR
> +	/*
> +	 * Stat data v1 doesn't support ACLs.
> +	 */
> +	if (get_inode_sd_version(inode) != STAT_DATA_V1)
> +		return generic_permission(inode, mask, reiserfs_check_acl);
> +#endif
> +
> +	return generic_permission(inode, mask, NULL);

Works for me.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkoHYw4ACgkQLPWxlyuTD7JdrACfdMo7wPBtIGBadVEBKiviD4i9
H4oAoKf1GtugtaiTVZdwwveaTPxBRD/T
=JiZ1
-----END PGP SIGNATURE-----
