From: Christoph Hellwig <hch@infradead.org>
Subject: Re: I oppose Chris and Jeff's patch to add an unnecessary additional namespace to ReiserFS
Date: Tue, 27 Apr 2004 19:04:39 +0100
Message-ID: <20040427190439.A20646@infradead.org>
References: <1082750045.12989.199.camel@watt.suse.com> <408D3FEE.1030603@namesys.com> <20040426203314.A6973@infradead.org> <408E986F.90506@namesys.com> <20040427183400.A20221@infradead.org> <408E9F42.2080804@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18255-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <408E9F42.2080804@namesys.com>; from reiser@namesys.com on Tue, Apr 27, 2004 at 10:58:26AM -0700
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>, Linus Torvalds <torvalds@osdl.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, akpm@osdl.org

On Tue, Apr 27, 2004 at 10:58:26AM -0700, Hans Reiser wrote:
> Ask the users whether their laptops, etc.,  seem to go a lot faster with 
> V4.  They seem to be pretty happy with it.
> 
> V4 fixed all of V3's serious performance flaws, and totally obsoletes 
> it.    I am very happy with it.

Hans, that's not what we're discussing in this thread.  I don't give a shit
whether filesystem A is fater than filesystem B on task C.  Really, how
fast a fs is an implementation details.

I also still think someone who does most work in the last years on a fs
(Chris on reiserfs v3) should be considered maintainer, but that's just my
2cents and I'd rather leave that to you guys.

The important part is xattr/acl/namespace semantics.  In Linux those
semantics are at the _VFS_ level, not at the individual filesystem,
in fact if a fs can mess with namespace semantics I'd almost considere
that a bug.

So if you want different xattr/acl semantics after you ignored all the
discussion has been going on the last years start *now* to discuss you
proposal on -fsdevel, and acl-devel, explaining why your semantics are
better and hash out the implementation details to support both
transparently.

Funneling in new semantics through a low level driver is pretty much
always wrong.
