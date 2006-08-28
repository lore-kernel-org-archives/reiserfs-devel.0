From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 und LZO compression
Date: Mon, 28 Aug 2006 10:06:46 -0700
Message-ID: <44F322A6.9020200@namesys.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29710-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060827003426.GB5204@martell.zuzino.mipt.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>

Alexey Dobriyan wrote:
> Reiser4 developers, Andrew,
>
> The patch below is so-called reiser4 LZO compression plugin as extracted
> from 2.6.18-rc4-mm3.
>
> I think it is an unauditable piece of shit and thus should not enter
> mainline.
>
>   
Hmm.  LZO is the best compression algorithm for the task as measured by
the objectives of good compression effectiveness while still having very
low CPU usage (the best of those written and GPL'd, there is a slightly
better one which is proprietary and uses more CPU, LZRW if I remember
right.  The gzip code base uses too much CPU, though I think Edward made
an option of it....).  Could you be kind enough to send me a plugin
which is better at those two measures, I'd be quite grateful?

By the way, could you tell me about this "auditing" stuff?  Last I
remember, when I mentioned that the US Defense community had coding
practices worth adopting by the Kernel Community, I was pretty much
disregarded.  So, while I understand that the FSB has serious security
issues what with all these Americans seeking to crack their Linux boxen,
complaining to me about auditability seems a bit graceless.;-) 
Especially if there is no offer of replacement compression code.

Oh, and this LZO code is not written by Namesys.  You can tell by the
utter lack of comments, assertions, etc.  We are just seeking to reuse
well known widely used code.  I have in the past been capable of
demanding that my programmers comment code not written by them before we
use it, but this time I did not.  I have mixed feeling about us adding
our comments to code written by a compression specialist.  If Andrew
wants us to write our own compression code, or comment this code and
fill it with asserts, we will grumble a bit and do it.  It is not a task
I am eager for, as compression code is a highly competitive field which
gives me the surface impression that if you are not gripped by what you
are sure is an inspiration you should stay out of it.  

Jorn wrote:

    I've had an identical argument with Linus about lib/zlib_*.  He
    decided that he didn't care about diverging, I went ahead and changed
    the code.  In the process, I merged a couple of outstanding bugfixes
    and reduced memory consumption by 25%.  Looks like Linus was right on
    that one.

Anyone sends myself or Edward a patch, that's great.  Jorn, sounds like
you did a good job on that one.

Hans
