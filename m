From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 0/6] kill-the-BKL/reiserfs3: performance improvements,
	faster than Bkl based scheme
Date: Fri, 1 May 2009 22:33:09 +0200
Message-ID: <20090501203309.GA6243@elte.hu>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com> <alpine.LFD.2.00.0905011236530.5379@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.0905011236530.5379@localhost.localdomain>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Fri, 1 May 2009, Frederic Weisbecker wrote:
> > 
> > This reiserfs patchset applies against latest 
> > tip:core/kill-the-BKL It adds various explicit write lock 
> > releases on specific sleeping sections.
> 
> Btw, is there any reason why it cannot just be re-based on top of 
> standard -rc4?
> 
> I'd love to pull a "reiserfs: remove bkl" branch when the next 
> merge window opens, but there's no way I'll pull the kill-bkl 
> thing with all the odd random tty stuff etc that is totally 
> unrelated.
> 
> And as far as I can tell, all your reiserfs patches are totally 
> unrelated to all other changes, and it would be _much_ nicer to 
> just merge the reiserfs ones.

Sure, that's sensible. Perhaps the patches could show up in the VFS 
tree once they are stable enough and are acceptable to Al. It will 
take quite a long time for the complete BKL elimination to be 
finished in our tree.

> So there's
>  - the filesystem mount bkl pushdown
> 
>  - the reiserfs series
> 
> and quite frankly, I'll happily take the straightforward BKL 
> pushdown, but I do _not_ want to see this mix-up with all the tty 
> stuff, or even the NFS and RPC changes.
> 
> In fact, if it makes it easier for people to merge, I can take the 
> pure VFS push-down that was already Ack'ed by Al. But the rest of 
> the stuff really isn't appropriate.
> 
> For example, every single
> 
> 	remove the BKL: remove "BKL auto-drop" assumption from xyz
> 
> patch in that series is pure and utter crap. I'm not going to take 
> things like that. But it looks like your reiserfs patches really 
> are totally independent of everything else, and should be merged 
> as such.

Yeah, we dont need that upstream.

It would obviously be a basic act of honesty and fairness to admit 
that that "crazy thing" was the thing that spurred and enabled the 
"good" patches to begin with.

We can whitewash that piece of embarrasing history out of existence 
of course, but i think it is axiomatic that if the only demonstrated 
way to achieve a good end result is over a messy middle step, that 
messy middle step shouldnt really be declared non-existent - even if 
we can.

The BKL is clearly removed at a faster reate with such debugging 
measures in place. With such measures the BKL _really_ hurts, and 
very visibly so - and that results in active removal.

	Ingo
