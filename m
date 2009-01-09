From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: problems with xattr in 2.6.28 and 2.6.27
Date: Thu, 08 Jan 2009 22:35:16 -0500
Message-ID: <4966C5F4.50409@suse.com>
References: <200901081104.40980.oliver@neukum.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200901081104.40980.oliver@neukum.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oliver Neukum <oliver@neukum.org>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Oliver Neukum wrote:
> Hi,
> 
> I am getting entries like this in syslog, but reiserfsck finds no errors
> in the filesystem.

Yeah, reiserfsck doesn't check them. If you run into these once in a
while, then setfattr -b is the answer. If you're seeing them en masse,
something is wonky.

I saw a report on b.n.c indicating that someone ran into these while
running a vanilla kernel, but the suse kernel doesn't exhibit the
problem. This isn't really surprising since the suse kernel contains the
"latest" reiser3 development. I know. I need to push it upstream.

- -Jeff

> 	Regards
> 		Oliver
> 2.6.28:
> 
> Jan  8 08:55:14 vanamonde kernel: REISERFS warning (device sda7): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (user.Beagle) assoc
> iated with [266558 266621 0x0 SD]
> Jan  8 08:55:14 vanamonde kernel: REISERFS warning (device sda7): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (user.Beagle) assoc
> iated with [266558 266631 0x0 SD]
> Jan  8 08:55:14 vanamonde kernel: REISERFS warning (device sda7): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (user.Beagle) assoc
> iated with [266558 266669 0x0 SD]
> Jan  8 08:55:15 vanamonde kernel: REISERFS warning (device sda7): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (user.Beagle) assoc
> iated with [266558 266691 0x0 SD]
> Jan  8 08:55:16 vanamonde kernel: REISERFS warning (device sda7): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (user.Beagle) assoc
> iated with [266558 266621 0x0 SD]
> Jan  8 08:55:16 vanamonde kernel: REISERFS warning (device sda7): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (user.Beagle) assoc
> iated with [266558 266631 0x0 SD]
> Jan  8 08:55:16 vanamonde kernel: REISERFS warning (device sda7): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (user.Beagle) assoc
> iated with [266558 266669 0x0 SD]
> 
> 2.6.27:
> 
> Jan  7 16:33:06 vanamonde kernel: ReiserFS: sda7: warning: Invalid hash for xattr (user.Beagle) associated with [959459378 3158320 0x0 SD]
> Jan  7 16:33:06 vanamonde kernel: ReiserFS: sda7: warning: Invalid hash for xattr (user.Beagle) associated with [959459378 3158320 0x0 SD]
> Jan  7 16:33:06 vanamonde kernel: ReiserFS: sda7: warning: Invalid hash for xattr (user.Beagle) associated with [959459378 3158320 0x0 SD]
> Jan  7 16:33:06 vanamonde kernel: ReiserFS: sda7: warning: Invalid hash for xattr (user.Beagle) associated with [959459378 3158320 0x0 SD]
> Jan  7 16:33:06 vanamonde kernel: ReiserFS: sda7: warning: Invalid hash for xattr (user.Beagle) associated with [959459378 3158320 0x0 SD]
> Jan  7 16:33:07 vanamonde kernel: ReiserFS: sda7: warning: Invalid hash for xattr (user.Beagle) associated with [959459378 892350768 892548608(49) DIR]
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAklmxfQACgkQLPWxlyuTD7K53gCfVN+4+xbPrxGyZ7tcQR/OKpDh
YlsAnRoW8vqx2LjZBJtMXcCALzoBe5RP
=65z7
-----END PGP SIGNATURE-----
