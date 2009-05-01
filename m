From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 0/6] kill-the-BKL/reiserfs3: performance improvements,
 faster than Bkl based scheme
Date: Fri, 1 May 2009 12:59:55 -0700 (PDT)
Message-ID: <alpine.LFD.2.00.0905011236530.5379@localhost.localdomain>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>


On Fri, 1 May 2009, Frederic Weisbecker wrote:
> 
> This reiserfs patchset applies against latest tip:core/kill-the-BKL
> It adds various explicit write lock releases on specific sleeping sections.

Btw, is there any reason why it cannot just be re-based on top of standard 
-rc4?

I'd love to pull a "reiserfs: remove bkl" branch when the next merge 
window opens, but there's no way I'll pull the kill-bkl thing with all the 
odd random tty stuff etc that is totally unrelated.

And as far as I can tell, all your reiserfs patches are totally unrelated 
to all other changes, and it would be _much_ nicer to just merge the 
reiserfs ones.

So there's
 - the filesystem mount bkl pushdown

 - the reiserfs series

and quite frankly, I'll happily take the straightforward BKL pushdown, but 
I do _not_ want to see this mix-up with all the tty stuff, or even the NFS 
and RPC changes. 

In fact, if it makes it easier for people to merge, I can take the pure 
VFS push-down that was already Ack'ed by Al. But the rest of the stuff 
really isn't appropriate. 

For example, every single

	remove the BKL: remove "BKL auto-drop" assumption from xyz

patch in that series is pure and utter crap. I'm not going to take things 
like that. But it looks like your reiserfs patches really are totally 
independent of everything else, and should be merged as such.

		Linus
