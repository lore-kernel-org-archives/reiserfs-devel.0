From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Question: Reiser4 and 2.6.27x kernel
Date: Sat, 06 Dec 2008 10:46:39 -0500
Message-ID: <493A9E5F.7050605@suse.com>
References: <11024.202.168.22.19.1223552449.squirrel@webmail.velocity.net.au>    <48EE0B25.6000203@suse.com> <18813.202.168.22.19.1228524627.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <18813.202.168.22.19.1228524627.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Hello,
> - Is there any progression with this item about the Reiser4
> module(reiser4.ko) available for the 2.6.27 kernel in the OpenSuse
> buildservice ?
> 
> - Could you supply details on how reiser4.ko is compiled/built ?

The packages are all set again. Sorry about that.

The packages are built using the openSUSE KMP process, where a few
macros make it easy to create a package containing supplementary kernel
modules.

Easier than describing how it works, you might as well download the
source RPM. That contains the patches needed to allow it to build across
multiple releases. I haven't done the work to make it 10.3-compatible
yet and I'm not really planning on it. Since you're asking about 2.6.27,
I don't suppose that's a problem.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkk6nl4ACgkQLPWxlyuTD7INegCcDna20lGBkOw8of+YQIo+pr9f
Po8AoKisy1aDVNXFKU7LOE+GZ+HHWHYg
=SAO/
-----END PGP SIGNATURE-----
