From: Shawn <core@enodev.com>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: 23 Jul 2003 23:31:53 -0500
Message-ID: <1059021113.7911.13.camel@localhost>
References: <3F1EF7DB.2010805@namesys.com>  <3F1F6005.4060307@tupshin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15019-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F1F6005.4060307@tupshin.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tupshin Harper <tupshin@tupshin.com>
Cc: Hans Reiser <reiser@namesys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@namesys.com>

This is pretty f'ed, but it's on ftp://ftp.namesys.com/pub/tmp

On Wed, 2003-07-23 at 23:26, Tupshin Harper wrote:
> Hans Reiser wrote:
> 
> > Please look at http://www.namesys.com/benchmarks/v4marks.html
> >
> > In brief, V4 is way faster than V3, and the wandering logs are indeed 
> > twice as fast as fixed location logs when performing writes in large 
> > batches.
> >
> <snip>
> I am interested in testing this out, but the latest patch on the namesys 
> sight appears to be against 2.5.60 which was never usable on my 
> hardware. If there is a later patch, or if somebody has adapted it to 
> work against 2.6.0-test1(or anything comparably recent), please let me know.
> 
> -Tupshin
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
