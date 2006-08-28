From: Stefan Traby <stefan@hello-penguin.com>
Subject: Re: Reiser4 und LZO compression
Date: Mon, 28 Aug 2006 19:37:21 +0200
Message-ID: <20060828173721.GA11332@hello-penguin.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru> <44F322A6.9020200@namesys.com>
Reply-To: Stefan Traby <stefan@hello-penguin.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29712-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44F322A6.9020200@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>

On Mon, Aug 28, 2006 at 10:06:46AM -0700, Hans Reiser wrote:

> Hmm.  LZO is the best compression algorithm for the task as measured by
> the objectives of good compression effectiveness while still having very
> low CPU usage (the best of those written and GPL'd, there is a slightly
> better one which is proprietary and uses more CPU, LZRW if I remember
> right.  The gzip code base uses too much CPU, though I think Edward made

I don't think that LZO beats LZF in both speed and compression ratio.

LZF is also available under GPL (dual-licensed BSD) and was choosen in favor
of LZO for the next generation suspend-to-disk code of the Linux kernel.

see: http://www.goof.com/pcg/marc/liblzf.html

-- 

  ciao - 
    Stefan
