From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Question: Reiser4 and 2.6.27x kernel
Date: Thu, 09 Oct 2008 09:46:13 -0400
Message-ID: <48EE0B25.6000203@suse.com>
References: <11024.202.168.22.19.1223552449.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <11024.202.168.22.19.1223552449.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Hello
> A question for Jeff.
> 
> Q1. Is there a Reiser4 module(reiser4.ko) available for the 2.6.27-rc*
> kernel ?, or will there be one made available for 2.6.27x kernel ?
> 
> I was looking for one at
> http://download.opensuse.org/repositories/drivers:/filesystems/openSUSE_Factory/x86_64/
> 
> I tried to install the current version but failed.
> 
> # rpm -ivhU reiser4-kmp-default-0.1_2.6.26_11.4-22.11.x86_64.rpm
> warning: reiser4-kmp-default-0.1_2.6.26_11.4-22.11.x86_64.rpm: Header V3
> DSA signature: NOKEY, key ID 74de2879
> error: Failed dependencies:
>         kernel(default:vmlinux) = 214a1cfb3969f710 is needed by
> reiser4-kmp-default-0.1_2.6.26_11.4-22.11.x86_64
> 
> # uname -a
> Linux linux.site 2.6.27-rc7-12-default #1 SMP 2008-09-29 23:39:54 +0200
> x86_64 x86_64 x86_64 GNU/Linux

It looks like the build service is currently hung up on something there.
It's waiting on kernel-source and kernel-syms to finish building, but it
appears to have been waiting a very long time. We're looking at a
related problem internally. Sorry, no ETA for a fix.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkjuCyUACgkQLPWxlyuTD7JO6gCfSD55P37OLG2a+XIbLj6Iq5VQ
PUUAoJ0WOVqVHnZ/SaSMs9yaw3CyHswX
=o7aP
-----END PGP SIGNATURE-----
