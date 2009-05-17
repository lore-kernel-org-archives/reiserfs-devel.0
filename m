From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch 4/4] reiserfs: allow exposing privroot w/ xattrs
 enabled
Date: Sun, 17 May 2009 10:10:40 -0700 (PDT)
Message-ID: <alpine.LFD.2.01.0905171009200.3301@localhost.localdomain>
References: <20090517050200.786752018@suse.com> <20090517050332.566856122@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090517050332.566856122@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>



On Sun, 17 May 2009, Jeff Mahoney wrote:
>
> --- a/fs/reiserfs/dir.c
> +++ b/fs/reiserfs/dir.c

Hmm. This had no explanation or sign-off. Please? At least the sign-off, 
but I think I'd like a log message too, since this adds a new mount option 
etc, so it's not like this is some trivial one-liner that doesn't need it.

		Linus
