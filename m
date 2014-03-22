From: tytso@mit.edu
Subject: Re: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Sat, 22 Mar 2014 13:03:22 -0400
Message-ID: <20140322170322.GA23583@thunk.org>
References: <20140321171830.ef47fdea1a3a2f2921c8fe86@skynet.be>
 <20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=thunk.org; s=mail;
	t=1395507802; bh=ot4TYI51sMSlYIS/8ftW7i/yumkZAEQmu3d9o5TYfKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BrJ+zsRfPXtm+TVV4o5bIQlyFVFjgDZUuYx+B5bRkHMt90RYAbojtxO+35gAowenF
	 RLEpPtr2NLVWv2HN4aVGQhG7RSfGktFvs/WVOioiuNaryVYUE8fNj5ROJmRZ/a5LGR
	 gYIui3uemXVba5369mqwt4sijI+TlXg9pikB0BnQ=
Content-Disposition: inline
In-Reply-To: <20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

On Fri, Mar 21, 2014 at 01:00:55PM -0700, Andrew Morton wrote:
> 
> The whole point of __GFP_NOFAIL is to centralise this
> wait-for-memory-for-ever operation.  So it is implemented in a common
> (core) place and so that we can easily locate these problematic
> callers.
> 
> is exactly wrong.  Yes, we'd like __GFP_NOFAIL to go away, but it
> cannot go away until buggy callsites such as this one are *fixed*. 
> Removing the __GFP_NOFAIL usage simply hides the buggy code from casual
> searchers.

The change to jbd2 was made in July 2010, back when the "we must
exterminate GFP_NOFAIL at all costs" brigade was in high gear, and the
folks claiming that GFP_FAIL *would* go away, come hell or high water,
was a bit more emphatic.

I'll note that since 2011, there has been precious little movement on
removing the final few callers of GFP_NOFAIL, and we still have a bit
under two dozen of them, including a new one in fs/buffer.c that was
added in 2013.

In any case, __GFP_NOFAIL is in the code comments, so a casual
searcher would find it pretty quickly with a "git grep".

	       	       	      	      	   - Ted
