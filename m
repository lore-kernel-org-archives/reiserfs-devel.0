From: Jamie Lokier <jamie@shareable.org>
Subject: Re: Separating Indexing and Searching (was silent semantic changes with reiser4)
Date: Wed, 1 Sep 2004 21:41:30 +0100
Message-ID: <20040901204130.GH31934@mail.shareable.org>
References: <584702172685-BeMail@cr593174-a> <41310364.8070302@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21225-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41310364.8070302@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: "Alexander G. M. Smith" <agmsmith@rogers.com>, Will Dyson <will_dyson@pobox.com>, akpm@osdl.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Hans Reiser wrote:
> Symlinks also.  Symlinks with powerful queries in them would require a 
> parser in the kernel.

No they wouldn't.  You can do symlinks with powerful queries in
userspace _today_ (as well as directories which list queries).

Making queries be up to date in real-time is still a problem, but that
has nothing to do with symlinks or directories, or where the parsers live.

> Thanks for helping me to distill my incoherent reasons for the
> parser being in the kernel.

This is one occasion where you're mistaken :)

There may be other reasons for parsing query strings in the kernel
(though I'm not convinced there are any), but this isn't one.

-- Jamie
