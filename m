From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser4 und LZO compression
Date: Mon, 28 Aug 2006 22:15:50 +0400
Message-ID: <44F332D6.6040209@namesys.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru> <44F322A6.9020200@namesys.com> <20060828173721.GA11332@hello-penguin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29714-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060828173721.GA11332@hello-penguin.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stefan Traby <stefan@hello-penguin.com>
Cc: Hans Reiser <reiser@namesys.com>, Alexey Dobriyan <adobriyan@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>

Stefan Traby wrote:
> On Mon, Aug 28, 2006 at 10:06:46AM -0700, Hans Reiser wrote:
> 
> 
>>Hmm.  LZO is the best compression algorithm for the task as measured by
>>the objectives of good compression effectiveness while still having very
>>low CPU usage (the best of those written and GPL'd, there is a slightly
>>better one which is proprietary and uses more CPU, LZRW if I remember
>>right.  The gzip code base uses too much CPU, though I think Edward made
> 
> 
> I don't think that LZO beats LZF in both speed and compression ratio.
> 
> LZF is also available under GPL (dual-licensed BSD) and was choosen in favor
> of LZO for the next generation suspend-to-disk code of the Linux kernel.
> 
> see: http://www.goof.com/pcg/marc/liblzf.html
> 

thanks for the info, we will compare them
