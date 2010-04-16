From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH RFC]  buffer_head: remove redundant test from wait_on_buffer
Date: Fri, 16 Apr 2010 18:18:58 -0400
Message-ID: <4BC8E252.8030400@suse.com>
References: <1271415499.2075.19.camel@localhost> <20100416145123.283f216c.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20100416145123.283f216c.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Kennedy <richard@rsk.demon.co.uk>, Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <jens.axboe@oracle.com>, lkml <linux-kernel@vger.kernel.org>, Nick Piggin <npiggin@suse.de>, reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/16/2010 05:51 PM, Andrew Morton wrote:
> And while we're there...
> 
> This might make reiserfs explode.
> We can remove __wait_on_buffer() altogether now.  For some strange reason
> reiserfs calls __wait_on_buffer() directly.  Maybe it's passing in
> zero-ref buffers.  If so, we'll get warnings now and shall need to look at
> that.

I don't think that's the case. I think reiserfs just calls
__wait_on_buffer just to skip the duplicate buffer_locked() test since
every call is in an "if buffer_locked()" block. I don't think it's
passing in zero-ref buffers anywhere, and I'd prefer it to explode if it is.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAkvI4lIACgkQLPWxlyuTD7Ju9wCgphZEI8r9jB+75PIxE4l/S/H+
jlEAnR+vo57PB2ZH+PhTSoxWnQ9V74M3
=bQAA
-----END PGP SIGNATURE-----
