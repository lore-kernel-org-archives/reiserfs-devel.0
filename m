From: Geoff Oakham <g@mbl.ca>
Subject: Re: libaal documentation: fact or fiction?
Date: Wed, 8 Oct 2003 15:01:46 -0400
Message-ID: <20031008190146.GA11458@mbl.ca>
References: <3F82F657.8040605@mbl.ca> <3F83B424.90107@namesys.com> <20031008163202.GA2185@mbl.ca> <3F84538B.9010109@namesys.com>
Reply-To: Geoff Oakham <g@mbl.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15813-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F84538B.9010109@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yury Umanets <umka@namesys.com>
Cc: reiserfs-list@namesys.com

On Wed, Oct 08, 2003 at 10:12:27PM +0400, Yury Umanets wrote:
> >Is this library the userland interface applications use to write to
> >files in atomic operations?
> No. It serves just for having persistent interface for working with 
> device inside libreiser4.

So this is the library Lilo & friends would want to use to find out
where a kernel image is physically located on disk?  Thanks for setting
me straight on this one..  obviously I've guessed wrong.

> Ok, I see, but libreiser4 does not any things with journaling and so on. 
> So, probably it is better to start from reading resier4 design documents 
> on our website and then take a look to kernel code.

Although I find the design documents very interesting, I can't say I
find them helpful for navigating the source.  Perhaps I haven't read
them thoroughly enough.

> We will have userspace API for controlling transactions and other things 
> latter when sys_reiser4() is finished.

Ah, that's good to know.  What's the status of that work?

> > Futhermore, I want to see if it's possible
> >to implement the equivalent functionality (at least from a programmer's
> >perspective) on a traditional UNIX filesystem using old-fasioned
> >file-locking.
> >
> Can you say more detailed about this? What do you mean speaking about 
> old-fasioned file-locking?

Sure: Imagine I'm the author of 'mutt', a popular mail reader.  [I'm
not, but for this "use case," please imagine I am.]  'mutt' allows
multiple instances of itself to run in parallel.. which means I have to
be careful when reading and writing to the [poor] user's mailbox.
Traditionally, this meant I would have to group all my file access into
'critical sections' and obtain an appropriate file locks for the
duration of each section.

At the begining & end of the critical sections, I should be able to
assert the file is in a valid, "non-corrupt" state.  Wait... this sounds
suspiciously like a "transaction": if I wanted to modify mutt to take
advantage of reiserfs4's data journalling, the critical sections would
be the obvious place to do it.

Imagine that I've gone ahead and made these modifications.  My next
thought would be: "ok, now without using #ifdefs, how can I continue to
support legacy platforms [and/or filesystems] that don't support data
journalling?"  This is where I'd hope a good userspace library could
step in.

Does that make sense, or am I completely missing the point of data
journalling?

Thanks,

Geoff

-- 
  PGP fingerprint: 8ADC 92E1 6782 D034 E0E3  8EF4 EA4D 25E3 C17C 48D2
  "If you want to learn more about guns, get a job at [an American]
  convenience store or visit our website at ... " --Michael Moore

