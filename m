From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 03/04] reiserfs: reorganize bitmap loading functions
Date: Mon, 26 Jun 2006 10:52:21 -0400
Message-ID: <449FF4A5.2030006@suse.com>
References: <20060615014203.GA8216@locomotive.unixthugs.org> <449FCEF7.5060202@in.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750745AbWFZOwh@vger.kernel.org>
In-Reply-To: <449FCEF7.5060202@in.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Suzuki <suzuki@in.ibm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, ReiserFS Mailing list <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Suzuki wrote:
> Hi,
> 
> We hit a BUG while running fsstress tests on 2.6.17-mm1. It looks like
> the BUG was introduced with this code change.

Thanks for the report, but it's known and fixed. Please apply the
patches in the mm1 hotfixes directory.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFEn/SlLPWxlyuTD7IRAvwCAKCKnUI4BYWcp5ivNxWuhlljnRJU/gCcD+Nm
TFFzgbHrnx6mrIHA0faJulE=
=O7SM
-----END PGP SIGNATURE-----
