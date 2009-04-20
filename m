From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: 2.6.30-rc2: reiserfs_delete_xattrs: Couldn't delete all xattrs
 (-13)
Date: Mon, 20 Apr 2009 10:13:43 -0400
Message-ID: <49EC8317.9080300@suse.com>
References: <a4423d670904161223r2e026b6u903137c709318551@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <a4423d670904161223r2e026b6u903137c709318551@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alexander Beregalov wrote:
> Hi Jeff
> 
> The kernel prints this message every 20seconds
> [  836.973100]
> [  836.983494] REISERFS warning (device sda2): jdm-20004
> reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)
> [  836.983496]
> [  894.203634] REISERFS warning (device sda2): jdm-20004
> reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)
> [  894.203636]
> [  894.205784] REISERFS warning (device sda2): jdm-20004
> reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)
> 
> commit a41f1a4715
> 
> CONFIG_REISERFS_FS=y
> # CONFIG_REISERFS_CHECK is not set
> # CONFIG_REISERFS_PROC_INFO is not set
> # CONFIG_REISERFS_FS_XATTR is not set
> 
> I did not enable XATTR before,
> should I enable it now ?

You shouldn't need to, and you shouldn't be seeing those messages.

What are you doing to reproduce it? I disabled the xattr config option,
copied a directory tree over and removed it. I didn't see anything.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAknsgxYACgkQLPWxlyuTD7KkKwCfXsftdSG2/EcN0/GLvczu77BB
5DkAnA19mRH2GoxrM5l28kcVAXqKUcdB
=j/bW
-----END PGP SIGNATURE-----
