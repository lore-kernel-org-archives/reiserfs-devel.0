From: Geoff Oakham <g@mbl.ca>
Subject: Re: libaal documentation: fact or fiction?
Date: Wed, 8 Oct 2003 16:46:18 -0400
Message-ID: <20031008204618.GA14476@mbl.ca>
References: <3F82F657.8040605@mbl.ca> <3F83B424.90107@namesys.com> <20031008163202.GA2185@mbl.ca> <3F84538B.9010109@namesys.com> <20031008190146.GA11458@mbl.ca> <3F846C07.2030707@namesys.com>
Reply-To: Geoff Oakham <g@mbl.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15816-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F846C07.2030707@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yury Umanets <umka@namesys.com>
Cc: reiserfs-list@namesys.com

On Wed, Oct 08, 2003 at 11:56:55PM +0400, Yury Umanets wrote:
> >>We will have userspace API for controlling transactions and other things 
> >>latter when sys_reiser4() is finished.
> >Ah, that's good to know.  What's the status of that work?
> Actually I'm not sure, that my information about the status is up 
> to-date. Ask Hans about this.

Does Hans monitor all traffic here, or should I explicitly ping() him?

> Hm.. It's cool idea. There only a thing... It is needed to rewrite mutt 
> and other tools to use this critical section. Also,  this should be 
> system wide, I mean, that linux should support this feature in its VFS. 
> I guess Hans will be interesting to discuss this more detailed.

*nod* I think Hans mentioned something about trying out potential
changes to VFS initially on reiserfs.. somewhere in the documentation.
(I can't remember where.)

> Yet another method that comed to my mind, is to impelement ability to 
> open not the whole file, but some its part and to have separated file 
> descriptor for that file. It seems, that QNX is able to do so.

That sounds oddly familiar.  Didn't one of the dozens of attempts to
standardize file locking protocols consider this approch?  (I know enough
about file locking to know I should avoid it.)

I seem to remember NFS to be a particularily dodgy spot for this stuff.

> So, you propose to use some kind of crossover between applications and 
> actual call to kernel? And this bridge should decide is backend 
> filesystem is able to do journaling and has user space journaling 
> control API? It is yet another good idea.

Umm.. yes?  (I'm sorry, I'm not sure I follow, so I'll ramble a bit and
hope I mention something approaching an answer.)

I'd like this library to behave properly in most situations:

  a. Reiser supports transactions, kernel does not [yet?].
  b. VFS supports transactions
  c. OS is not Linux and/or does not support transactions at all.

  i. filesystem supports transactions
  ii. filesystem does not support transactions

Where exactly you put the code that chooses the appropriate
implementation doesn't matter.  I think it will vary depending on the
platform & situation.. regardless, it should be hidden from the user.
Obviously in situation #c, it would have to be handled at compile time.
In #b, the kernel would handle it.  #a.. perhaps both user and kernel
will be needed..?

Geoff

-- 
  PGP fingerprint: 8ADC 92E1 6782 D034 E0E3  8EF4 EA4D 25E3 C17C 48D2
  "If you want to learn more about guns, get a job at [an American]
  convenience store or visit our website at ... " --Michael Moore

