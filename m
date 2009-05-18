From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch 4/4] reiserfs: allow exposing privroot w/ xattrs
 enabled
Date: Mon, 18 May 2009 10:42:13 -0700 (PDT)
Message-ID: <alpine.LFD.2.01.0905181041570.3301@localhost.localdomain>
References: <20090517050200.786752018@suse.com> <20090517050332.566856122@suse.com> <alpine.LFD.2.01.0905171009200.3301@localhost.localdomain> <alpine.LFD.2.01.0905181026560.3301@localhost.localdomain> <4A119C75.3030400@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4A119C75.3030400@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>



On Mon, 18 May 2009, Jeff Mahoney wrote:
> 
> Sorry, I was in and out all weekend. Don't bother merging it for this
> window. I wanted to make it easy to clean up xattrs that would have been
> left around if a file system that contained xattrs was migrated to a
> kernel without support compiled in, but I'll add that to fsck instead.

Ok, thanks, patch happily forgotten,

		Linus
