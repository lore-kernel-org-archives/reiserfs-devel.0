From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Build Log failure for Package reiser4-kmp
Date: Wed, 10 Jun 2009 01:16:57 -0400
Message-ID: <4A2F41C9.1090708@suse.com>
References: <12161.202.168.22.19.1244439532.squirrel@webmail.velocity.net.au>    <4A2CB7E3.80401@suse.com>    <19264.202.168.22.19.1244470613.squirrel@webmail.velocity.net.au> <27558.202.168.22.19.1244610422.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <27558.202.168.22.19.1244610422.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Thanks Jeff
> What kernel project do I need to 'watch' so I can see if the kernel builds
> ok, then I can see what the reiser 4 module build is doing.
> Also does a kernel build take a long time eg > 2 days also is the reiser4
> module quick to build eg 1 day ,and is it ready to build.

It's not just the build, it's the acceptance process. I can (and have)
submitted a new kernel, but it needs to become part of Factory before it
can be built against. It should be Kernel:Head I think.

Once that happens, the reiser4-kmp project should build fairly quickly.

I know it's not fun, but that's life on the bleeding edge. ;)

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkovQckACgkQLPWxlyuTD7LfEgCfQvZS+TNGV00S+oWvLNYX5j4m
R0cAn0DRx6AxNQCBULUTqs8e6o8h9c9F
=554V
-----END PGP SIGNATURE-----
