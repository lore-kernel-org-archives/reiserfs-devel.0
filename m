From: Rik van Riel <riel@redhat.com>
Subject: Re: Using fs views to isolate untrusted processes: I need an assistant
 architect in the USA for Phase I of a DARPA funded linux kernel project
Date: Wed, 25 Aug 2004 16:25:24 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0408251624540.5145-100000@chimarrao.boston.redhat.com>
References: <410D96DC.1060405@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20513-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <410D96DC.1060405@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Sun, 1 Aug 2004, Hans Reiser wrote:

> You can think of this as chroot on steroids.

Sounds like what you want is pretty much the namespace stuff
that has been in the kernel since the early 2.4 days.

No need to replicate VFS functionality inside the filesystem.

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

