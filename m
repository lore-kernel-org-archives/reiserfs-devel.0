From: evilninja <evilninja@gmx.net>
Subject: Re: SUSE 9.1 with ReiserFS:  / won't fsck, but is otherwise fine
Date: Wed, 29 Sep 2004 02:38:27 +0200
Message-ID: <415A0403.3040806@gmx.net>
References: <1095996040.10293.18.camel@xserver.local.net>	 <200409241116.09066.vitaly@namesys.com>	 <1096032016.17001.4.camel@xserver.local.net>	 <200409271844.11580.vitaly@namesys.com>	 <1096301165.9096.14.camel@xserver.local.net>  <41589155.1050405@gmx.net> <1096324801.9096.41.camel@xserver.local.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21953-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1096324801.9096.41.camel@xserver.local.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chris Worley wrote:
> I find the root partition an invaluable part of the system.  So, I'm not
> going to destroy it on purpose.  I'm not quite sure how to boot without
> a root partition ;)

you did backup at least /etc , didn't you? if so, then a quick reinstall
of your distro (and thus overwriting "/" ) should be not that painful.

> I'm really looking for a non-destructive way to test/repair whatever has
> happened. 

well, there's always http://www.namesys.com/support.html   ;)

Christian.
- --
BOFH excuse #71:

The file system is full of it
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBWgQDC/PVm5+NVoYRApvLAKCXAWCz3PrDzLehnrTBEUeIGtwFWACgkIdh
wr4EZlLE0y76Srjny9Bt8Qw=
=i5O+
-----END PGP SIGNATURE-----
