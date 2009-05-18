From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch 4/4] reiserfs: allow exposing privroot w/ xattrs
 enabled
Date: Mon, 18 May 2009 10:28:37 -0700 (PDT)
Message-ID: <alpine.LFD.2.01.0905181026560.3301@localhost.localdomain>
References: <20090517050200.786752018@suse.com> <20090517050332.566856122@suse.com> <alpine.LFD.2.01.0905171009200.3301@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.01.0905171009200.3301@localhost.localdomain>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>



On Sun, 17 May 2009, Linus Torvalds wrote:
> 
> 
> On Sun, 17 May 2009, Jeff Mahoney wrote:
> >
> > --- a/fs/reiserfs/dir.c
> > +++ b/fs/reiserfs/dir.c
> 
> Hmm. This had no explanation or sign-off. Please? At least the sign-off, 
> but I think I'd like a log message too, since this adds a new mount option 
> etc, so it's not like this is some trivial one-liner that doesn't need it.

Jeff, ping?

I merged the other three patches, but this one is still pending. I'm not 
entirely sure it's even appropriate for 2.6.30 (it doesn't _look_ like 
it's fixing any regressions), but even if you don't actually want me to 
merge it, can you say so? And if you do want me to merge it, I want the 
sign-off and fuller log message..

		Linus
