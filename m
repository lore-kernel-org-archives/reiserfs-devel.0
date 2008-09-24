From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [LOCKDEP linux-2.6.27-rc7] reiserfs circular locking
Date: Wed, 24 Sep 2008 17:18:35 -0400
Message-ID: <48DAAEAB.50009@suse.com>
References: <4807377b0809241139x18ea8ce4x7dbc66ba680be3e7@mail.gmail.com>	<48DA8D27.5080908@suse.com> <20080924221425.3b4939ba@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753982AbYIXVTV@vger.kernel.org>
In-Reply-To: <20080924221425.3b4939ba@lxorguk.ukuu.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Jesse Brandeburg <jesse.brandeburg@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, arjan@linux.intel.com, reiserfs-devel@vger.kernel.org, peterz@infradead.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alan Cox wrote:
>> I have a reiserfs patch set that should address this. I haven't
>> submitted it recently because I'm chasing down a reiserfs bug report
>> that may or may not be related to the patch set.
>>
>> You can grab the patch set out of an opensuse kernel src rpm.
> 
> Jeff: See also bugzilla.kernel.org #9136 which seems to match
> 
> BTW - does anyone have a view where the existing reiserfs bugs should be
> assigned as they are currently assigned to namesys...

They're fine being assigned to the reiserfs development list, it's just
that the address in bko is wrong. The current address is
reiserfs-devel@vger.kernel.org.

I'll take this bug over, though.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkjarqsACgkQLPWxlyuTD7LCLQCdF5BDrD+cdYGlqFUZ+Pu5oi5/
aFsAnAhfHjv8oXjbR/zXTd1fuEa8abkj
=7ayP
-----END PGP SIGNATURE-----
