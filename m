From: <pcg( Marc)@goof(A.).(Lehmann )com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Wed, 29 Dec 2004 22:43:24 +0100
Message-ID: <20041229214324.GA5206@schmorp.de>
References: <20041228221218.GA6412@schmorp.de> <20041229185529.GA7513@hello-penguin.com> <41D31C22.9060400@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22938-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41D31C22.9060400@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Stefan Traby <stefan@hello-penguin.com>, reiserfs-list@namesys.com

On Wed, Dec 29, 2004 at 01:05:38PM -0800, Hans Reiser <reiser@namesys.com> wrote:
> Stefan Traby wrote:
> 
> >
> >
> >Here a script that works independent of hash (feel free to forward it to
> >bugtraq - it's a showstopper bug):
> > 
> >
> is not a showstopper bug

If it keeps debian from being usable on reiserfs (mind you, xfonts-75 and
xfonts-100 are not unimportant packages), I'd call this a showstopper
indeed *g*.

> --- almost nobody cared about it for the last 5 
> years.

This is a lame excuse for a bug - after all, you promoted reiserfs of being
capable of storing many files in one directory instead of having to rely on
directory hierarchies for e.g. squid and other apps. But exactly that is not
possible with reiserfs, as too many files in one directory == collisions.

Also, it's a lie that nobody cared about this, after all, there ahd been
earlier reports.

And last not least, most apps do not create many files in one directory by
default, for compatibility with other filesystems, where this is too slow.

> If you don't accept that quality of service condition on filename
> creation,

Again, this is a lame excuse for a bug. First you declare some features on
your filesystem, later, when it turns out that it isn't being delivered,
you act as if this were a known condition.

(Even if it were ok to fail file creation, the error generated is still
wrong. It is a bug, no matter how you try to twist it).

> use reiser4 or ext3. 

reiser4, is, of course, far from being stable enough for such uses still.

-- 
                The choice of a
      -----==-     _GNU_
      ----==-- _       generation     Marc Lehmann
      ---==---(_)__  __ ____  __      pcg@goof.com
      --==---/ / _ \/ // /\ \/ /      http://schmorp.de/
      -=====/_/_//_/\_,_/ /_/\_\      XX11-RIPE
