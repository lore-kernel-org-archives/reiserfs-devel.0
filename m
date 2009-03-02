From: Jeff Mahoney <jeffm@suse.com>
Subject: Re:
Date: Sun, 01 Mar 2009 20:47:14 -0500
Message-ID: <49AB3AA2.90509@suse.com>
References: <17c9de980903011521o4603b9d0kbfceb04e27dd540c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <17c9de980903011521o4603b9d0kbfceb04e27dd540c@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ilario Pittau <ilariopittau@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ilario Pittau wrote:
> Hi,
> I have a problem with the REISERFS_CHECK module.
> When I include it in the kernel the system boots correctly and it's
> possible read from the reiserfs partition.
> But when I try to write on, the system crash and go in kernel panic.
> If I compile the kernel without the REISERFS_CHECK module it's
> possible to write also, and the system does not crashes.

Without seeing the actual crash, it's tough to say what your problem is.
It could be a little-used check that is just wrong now, or it could be
file system corruption.

- -Jeff																											
- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkmrOqIACgkQLPWxlyuTD7LXoACfT00KTrxAmyckKdUUi8+IcBWY
D2QAniQ+gNwQa2Qau+cf47YNFDJGC5Wf
=3qTT
-----END PGP SIGNATURE-----
