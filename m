From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser4 und LZO compression
Date: Tue, 29 Aug 2006 13:29:47 +0400
Message-ID: <44F4090B.5010908@namesys.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>	 <44F322A6.9020200@namesys.com> <20060828173721.GA11332@hello-penguin.com>	 <44F332D6.6040209@namesys.com> <1156801705.2969.6.camel@nigel.suspend2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29725-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1156801705.2969.6.camel@nigel.suspend2.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nigel Cunningham <ncunningham@linuxmail.org>
Cc: Stefan Traby <stefan@hello-penguin.com>, Hans Reiser <reiser@namesys.com>, Alexey Dobriyan <adobriyan@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>

Nigel Cunningham wrote:
> Hi.
> 
> On Mon, 2006-08-28 at 22:15 +0400, Edward Shishkin wrote:
> 
>>Stefan Traby wrote:
>>
>>>On Mon, Aug 28, 2006 at 10:06:46AM -0700, Hans Reiser wrote:
>>>
>>>
>>>
>>>>Hmm.  LZO is the best compression algorithm for the task as measured by
>>>>the objectives of good compression effectiveness while still having very
>>>>low CPU usage (the best of those written and GPL'd, there is a slightly
>>>>better one which is proprietary and uses more CPU, LZRW if I remember
>>>>right.  The gzip code base uses too much CPU, though I think Edward made
>>>
>>>
>>>I don't think that LZO beats LZF in both speed and compression ratio.
>>>
>>>LZF is also available under GPL (dual-licensed BSD) and was choosen in favor
>>>of LZO for the next generation suspend-to-disk code of the Linux kernel.
>>>
>>>see: http://www.goof.com/pcg/marc/liblzf.html
>>>
>>
>>thanks for the info, we will compare them
> 
> 
> For Suspend2, we ended up converting the LZF support to a cryptoapi
> plugin. Is there any chance that you could use cryptoapi modules? We
> could then have a hope of sharing the support.
> 

No problems with using crypto-api. Reiser4 bypasses it, because
currently it supplies the only compression level, which is fairly
bad for compressed file systems.

Edward.

