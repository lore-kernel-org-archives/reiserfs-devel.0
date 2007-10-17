From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 0/7] reiserfs fixes patch set
Date: Wed, 17 Oct 2007 19:23:56 -0400
Message-ID: <4716998C.8050700@suse.com>
References: <20071016230210.779927000@suse.com> <20071017151140.c5b782ef.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20071017151140.c5b782ef.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: torvalds@linux-foundation.org, reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andrew Morton wrote:
> On Tue, 16 Oct 2007 19:02:10 -0400
> Jeff Mahoney <jeffm@suse.com> wrote:
> 
>>  This is a series of "safe" patches that have been in the openSUSE kernel
>>  for a while now.
>>
> 
> I'm not particularly happy seeing a large number of complex-looking patches
> against a not-very-well-maintained important filesystem more than a week
> into the merge window.  It would have been far better to get this stuff
> sent a month ago.
> 
> Now we're left with a choice between holding it all back for 2.5 months or
> just jamming it into mainline with basically no testing.  I sure hope it
> got good testing in the suse kernel.

I'm fine being conservative here and just keeping them in -mm, then.
Depending on when our next release ends up being scheduled, I'll likely
have to maintain them out of tree anyway.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFHFpmMLPWxlyuTD7IRAjstAJ4ze5cRUEFhVOkGiPCHrOMW/oQBLACeKgea
BYiWeJkzr/voo+1P60Xrgec=
=lo9N
-----END PGP SIGNATURE-----
