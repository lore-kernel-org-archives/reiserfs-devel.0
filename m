From: Christoph Hellwig <hch@lst.de>
Subject: Re: reiser4 plugins (was: silent semantic changes with reiser4)
Date: Sat, 28 Aug 2004 13:22:55 +0200
Message-ID: <20040828112255.GA11569@lst.de>
References: <412D9FE6.9050307@namesys.com> <20040826014542.4bfe7cc3.akpm@osdl.org> <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de> <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de> <1093526273.11694.8.camel@leto.cs.pocnet.net> <20040826132439.GA1188@lst.de> <1093527307.11694.23.camel@leto.cs.pocnet.net> <20040828111807.GC6746@alias>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20977-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040828111807.GC6746@alias>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: flx@msu.ru, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

On Sat, Aug 28, 2004 at 03:18:07PM +0400, Alexander Lyamin wrote:
> Yes, I think it would be nice to have this infrastructure in VFS. Technically.
> But its not possible, cause of "committee clusterfuck". Socially. Stupidly.

Please explain your problems.  I've not seen a single actually working
proposal yet.  Current reiser4 implementation apparently oopses and
breaks guaranteed fs semantics, it's not going in in either reiser4 or
the vfs.

Al has started a thread to hash out working semantics, but there's not been
a single namesys person involved.  Similar all of you have absolutely ignore
every single technical question or comment but started a flamefest
consisting mostly of personal attacs and "mine is longer" politics. 
