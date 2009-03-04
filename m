From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Is there please a build of reiser4.ko against      kernel-default-base-2.6.29x
Date: Wed, 04 Mar 2009 10:51:35 -0500
Message-ID: <49AEA387.5030305@suse.com>
References: <19332.202.168.22.19.1236161515.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <19332.202.168.22.19.1236161515.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Question for Jeff
> Hello,
> - Is there a reiser4 build reiser4.ko module against the following kernel -
> kernel-default-2.6.29-rc6.git1.23.1.x86_64.rpm
> 
> kernel location:
> http://download.opensuse.org/repositories/Kernel:/HEAD/openSUSE_Factory/x86_64/
> 
> If there is not one, what us the latest build of reiser4-kmp-default for
> opensuse kernel.?

Right now the build service is a little out of sync. The 11.1 kernel
update appears to be absent, and Factory looks like it has changes in
core dependencies that are still building. Once that completes I can
check if there are any build failures.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkmuo4cACgkQLPWxlyuTD7J9ZgCcCvfvnmgJhj1wpYsrf80Kh9WJ
uqYAn1WTMUvFSegN1jQrkfvYT9YjKfxC
=9d6z
-----END PGP SIGNATURE-----
