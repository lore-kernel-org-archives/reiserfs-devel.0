From: David Masover <jedi@ninja.dynup.net>
Subject: Re: formatting iomega zip on linux
Date: Sun, 01 Feb 2004 16:08:44 -0600
Message-ID: <401D78EC.4010304@ninja.dynup.net>
References: <20040201174355.28426.qmail@web80411.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16678-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040201174355.28426.qmail@web80411.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

It sort of depends on your goals.

If you want anyone to be able to read it, format it as vfat.  That way,
it will (probably) be readable by a Windows machine.  (I could be wrong
about this -- see how Windows formats a zip disk.)

If you want to make it easy to change later, I'd use reiser4 or xfs,
because you want it packed intelligently, and you might want the
flexibility to move things around and change your mind about what you
want on the device before you unmount it.

If you just want simple backup, in the same way that you'd want it if
you just burned some (non-rewritable) CDs, you probably want to use a
raw tar, and add some gzip/bzip2 compression if the drive doesn't do it
for you.  That compression probably won't matter anyway if it's just
pictures, though.

But really, what you want is a cdrw drive and ISO or UDF, depending on
whether you want to rewrite it or not.  The discs are cheaper, and the
filesystems are both universal and reasonably efficient.  And a .tar.bz2
probably won't help much anyway.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQB147AisZLIF6uqOAQJzYxAAhbuylrW2mCE86x4ZVED+y++j0KW/EvIe
zZC/oNBHXdXamrJM7zDK5zrfgcNaC43DL1zrVbzGm8Tst96HNs0EwS29nSxtXDQH
BpTyeNMKe0eDja/3EzmHuuqxHDgDPPgQkqwnbrCRmIDOLH/Kx15bmg+xpYHua4lG
h04Ax0iAX1RIT5OLNRGJi7ICMxp+DhksBfs5xMDM++JyjNg8flkZZ8Z0NGmjeCWY
NmgdwZMFRmSZS0GsM39r8j1NiaYs5oCUxj7FtN5FsoEoYT4+TvaWUNQVxiltU29w
RA6zegZ40p+iOmhhQAoe5aozP3OMWuWXiIuy/aJTVJ6Ej5IGcA8vznfn3Y14KjmT
66Okd4Xqlm02u7XCognUCBEawxeCcyqx9wkHqFmNTY0LfKiNqVLJVL6+gXxesj6c
4iyeIY8CmF6hmxnLOadkK1TeAgtLJnG8qcwC3BJGr2DQodPFIBdwOxUD2aXL+kdj
4IrUFsLZiKknWjc8Y+W7O0QNh3BBkbk4TGj8xwr9qXy5JVbT4fHPB1QnXu6oped7
xAISn9ekYMXu5utIf2k2UMhCk6GCIdK4wtLPoh12S8CYUaKCHYGWpsQ2kVw3kzgD
QZYC52hEz91iVuP4OqBYfyFjWZZOboZuqWmyv48frTIt9YoJ0Yfi2Ekqb5eRoSx8
vwo0QI+1Ihg=
=KZpU
-----END PGP SIGNATURE-----
