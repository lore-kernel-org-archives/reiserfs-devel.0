From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 0/6] kill-the-BKL/reiserfs3: performance improvements,
	faster than Bkl based scheme
Date: Fri, 1 May 2009 23:32:35 +0200
Message-ID: <20090501213235.GA20235@elte.hu>
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

Btw., i can name another reason why we'd want to do reiserfs 
separately: if our testing and efforts are any proof, then reiser3 
turned out to be the hardest BKL nut to crack, by a wide margin.

All the other hacks in kill-the-BKL are really of relatively low 
complexity and really just tried to map out the problem areas. Even 
the tty ones are simple - just a few recursion assumptions.

We _suspected_ that kind of status quo before, but we never had any 
conclusive proof of that. I think we now know that for sure, and we 
have to fear the BKL no more.

After the reiser3 conversion we should just tackle all the other BKL 
users one by one, and go for a straight subsystem mutex in every 
case: it will cause little trouble, and it will be a job that can be 
finished within a reasonable time frame.

	Ingo
