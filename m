From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: PROBLEM: "BUG" and hang with reiserfs, ACLs
Date: Tue, 08 Jul 2008 16:51:30 -0400
Message-ID: <4873D352.5000004@suse.com>
References: <1215544656.2307.23.camel@localhost> <4873C458.9070305@suse.com> <1215549804.2371.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1215549804.2371.1.camel@localhost>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt McCutchen <matt@mattmccutchen.net>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Matt McCutchen wrote:
> On Tue, 2008-07-08 at 15:47 -0400, Jeff Mahoney wrote:
>> Matt McCutchen wrote:
>>> When I run the rsync 3.0.3 test suite on a newly created reiserfs
>>> filesystem mounted with ACLs enabled, I get a kernel BUG (stack trace
>>> below) and all processes accessing the filesystem hang.
> 
>> Can you try to reproduce with the patch I posted this afternoon? The
>> subject is "[PATCH] reiserfs: discard prealloc in
>> reiserfs_delete_inode." I have another one, but I'm not sure if it's
>> actually needed.
> 
> With that patch, the problem is gone.  Are there any additional issues
> to be addressed with the patch, or should I go ahead and encourage the
> Fedora people to include it in their kernel?

Nope, you should be all set. The other patch I had fixed a symptom of
the bug this patch fixed.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkhz01IACgkQLPWxlyuTD7JmqgCgmrmozF4mnDEOJ6UZFXzyQ45z
+2sAn2bx0Bx0KhoqZp5k5ep2rZqHJ3Ng
=mS/y
-----END PGP SIGNATURE-----
