From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Reiser4 for Linux-2.6.27
Date: Sun, 12 Oct 2008 11:54:40 -0400
Message-ID: <48F21DC0.9070409@suse.com>
References: <48F1174B.5050704@gmail.com> <19940006.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <19940006.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: callx <pascalim@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

callx wrote:
> I was trying the patch and  get this error.. 
> 
> Kernel: arch/x86/boot/bzImage is ready (#1) 
>    Building modules, stage 2 
>    MODPOST 45 modules 
> ERROR: "swapper_space" [fs/reiser4/reiser4.ko] undefined! 
> make[1]: *** [__modpost] Error 1 
> make: *** [modules] Error 2 

This one looks like it's due to swapper_space not being exported. I
don't know if that's on purpose or just overlooked since all the current
users of page_mapping() are in core code.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkjyHcAACgkQLPWxlyuTD7K0XgCeI0yV6c6gUMX02+BZp1nwIdIw
MV8AoJPQWSM1K39in3vntIj1Eq+B2bFH
=ver0
-----END PGP SIGNATURE-----
