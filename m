From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 09/35 error-handling] reiserfs: add locking around error
 buffer
Date: Mon, 30 Mar 2009 15:32:39 -0400
Message-ID: <49D11E57.7060502@suse.com>
References: <20090330180215.951354436@suse.com>	<20090330181010.432220021@suse.com> <87y6umlud1.fsf@basil.nowhere.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <87y6umlud1.fsf@basil.nowhere.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <andi@firstfloor.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andi Kleen wrote:
> Jeff Mahoney <jeffm@suse.com> writes:
> 
>>  The formatting of the error buffer is race prone. It uses static buffers
>>  for both formatting and output. While overwriting the error buffer
>>  can product garbled output, overwriting the format buffer with incompatible
>>  % directives can cause crashes.
> 
> Really? Just curious but could you describe the steps how a garbled printk can
> leads to a crash?

Yeah, I was surprised by this one as well, but I was convinced by seeing
too many crashes that ended in prepare_error_buf with no other explanation.

Reiserfs has this really hacky way of formatting extended pointer types
where it copies the format buffer into a static buffer. If another
thread copies its format string into the format buffer while the first
thread is formatting its output, it can hit a pointer format that will
consume whatever happens to be on the stack whether it's valid or not.

I posted patches implementing extensible pointer types for printk to
avoid problems like this, but nobody commented on them.
prepare_error_buf() depends on undefined varargs behavior that just
happens to work. Something changed recently where I had to change it
stop consuming args manually, which is in another patch.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAknRHlcACgkQLPWxlyuTD7JgtACgiLRbO1IGhvKjmg6wCcZDhR9i
jkwAn0e81mXl6JvgZqmKqK8f09fApaoq
=fB0H
-----END PGP SIGNATURE-----
