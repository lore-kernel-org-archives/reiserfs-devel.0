From: Shawn <core@enodev.com>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: 24 Jul 2003 00:21:30 -0500
Message-ID: <1059024090.9728.22.camel@localhost>
References: <3F1EF7DB.2010805@namesys.com>  <3F1F6005.4060307@tupshin.com>
	 <1059021113.7911.13.camel@localhost>  <3F1F66F0.1050406@tupshin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15021-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F1F66F0.1050406@tupshin.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tupshin Harper <tupshin@tupshin.com>
Cc: Hans Reiser <reiser@namesys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@namesys.com>

Looks like the 2.5.74 is the last one of any respectable size. I'm
thinking someone forgot a diff switch (N?) over at namesys...

Hans? Time to long-distance spank someone?

On Wed, 2003-07-23 at 23:56, Tupshin Harper wrote:
> Shawn wrote:
> 
> >This is pretty f'ed, but it's on ftp://ftp.namesys.com/pub/tmp
> >
> Thanks, but I tried applying the
> 2.6.0-test1-reiser4-2.6.0-test1.diff from that location with a lack of 
> success.
> 
> It applied cleanly, but it doesn't add a fs/reiser4 directory and 
> asociated contents. Is there an additional patch, or is this one broken?
> 
> -Tupshin
> 
