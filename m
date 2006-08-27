From: Andrew Morton <akpm@osdl.org>
Subject: Re: Reiser4 und LZO compression
Date: Sun, 27 Aug 2006 01:04:28 -0700
Message-ID: <20060827010428.5c9d943b.akpm@osdl.org>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29696-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060827003426.GB5204@martell.zuzino.mipt.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Sun, 27 Aug 2006 04:34:26 +0400
Alexey Dobriyan <adobriyan@gmail.com> wrote:

> The patch below is so-called reiser4 LZO compression plugin as extracted
> from 2.6.18-rc4-mm3.
> 
> I think it is an unauditable piece of shit and thus should not enter
> mainline.

Like lib/inflate.c (and this new code should arguably be in lib/).

The problem is that if we clean this up, we've diverged very much from the
upstream implementation.  So taking in fixes and features from upstream
becomes harder and more error-prone.

I'd suspect that the maturity of these utilities is such that we could
afford to turn them into kernel code in the expectation that any future
changes will be small.  But it's not a completely simple call.

(iirc the inflate code had a buffer overrun a while back, which was found
and fixed in the upstream version).


