From: <pcg( Marc)@goof(A.).(Lehmann )com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 18:02:55 +0100
Message-ID: <20041230170255.GA23354@schmorp.de>
References: <20041228221218.GA6412@schmorp.de> <20041229185529.GA7513@hello-penguin.com> <41D31C22.9060400@namesys.com> <20041229214324.GA5206@schmorp.de> <41D36287.4080900@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22954-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41D36287.4080900@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, Stefan Traby <stefan@hello-penguin.com>

On Wed, Dec 29, 2004 at 06:05:59PM -0800, Hans Reiser <reiser@namesys.com> wrote:
> >
> >Again, this is a lame excuse for a bug. First you declare some features on
> >your filesystem, later, when it turns out that it isn't being delivered,
> >you act as if this were a known condition.
> > 
> >
> Well this is true, you are right.  Reiser4 is the fix though.

So that what happens to the filesystems develop once you have a new toy. Good
to know when planning my next server :)

> >(Even if it were ok to fail file creation, the error generated is still
> >wrong. It is a bug, no matter how you try to twist it).
> > 
> Blame Alan Cox for that, he changed it from -EHASHCOLLISION (or some 
> such error I invented, I forget) over my objections.

Blaming Cox for trying to fix your code and not getting it completely
right is not nice. After all, Cox also found that the error code is
inadequate. The point is that EBUSY is still bad, for open. ENOSPC is a
much better code, as it is a documented error code for open, whereas EBUSY
is not.

-- 
                The choice of a
      -----==-     _GNU_
      ----==-- _       generation     Marc Lehmann
      ---==---(_)__  __ ____  __      pcg@goof.com
      --==---/ / _ \/ // /\ \/ /      http://schmorp.de/
      -=====/_/_//_/\_,_/ /_/\_\      XX11-RIPE
