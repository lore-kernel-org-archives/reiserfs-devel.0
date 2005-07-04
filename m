From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Mon, 04 Jul 2005 14:05:32 -0500
Message-ID: <42C9887C.8080203@slaphack.com>
References: <200507020212.j622CQgb006811@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24946-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200507020212.j622CQgb006811@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Kevin Bowen <kevin@ucsd.edu>, Hubert Chan <hubert@uhoreg.ca>, Hans Reiser <reiser@namesys.com>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Horst von Brand wrote:
> Kevin Bowen <kevin@ucsd.edu> wrote:
> 
> [...]
> 
> 
>>>So, for instance, if I want to grab all mp3s with Artist "Paul 
>>>Oakenfold" and change the genre to "techno" (can you do that?), I can 
>>>use Beagle's search tool to find all mp3s by Oakenfold, but to change 
>>>the genre, I have to use some separate tool to manipulate id3 tags, 
> 
> 
>>Yes, this is basically what I was getting at, although I was thinking
>>more in terms of the reiser5/6/whatever set theoretic semantics, which,
>>from my point of view at least, reiser4 is simply the first step towards
>>building the enabling infrastructure of. But the fact that reiser4
>>semantics + trivial shell scripting enables, as illustrated by David,
>>the rough equivalent of set-theoretic semantics, demonstrates how
>>reiser4 is in fact a step in this direction.
> 
> 
> I don't see any "trivial shell scripting", just need for a plethora of
> magic extract-this-or-that-metadata programs. Which can very well work
> exactly the same on independent files, no need to shove junk /into/ the
> indexed files.
> 
> 
>>>>moment the case of system-wide or network-wide shared data,
>>>
>>>I.e., something like 90% of the use of Linux here. OK.
> 
> 
>>>>users needs. In fact, I believe there is currently a JSR in 
>>>>progress to develop a more sophisticated Java packaging model.
> 
> 
>>>Presumably based on ReiserFS 4, which then has to be ported to 
>>>whatever platform you want to run Java on ASAP? Great for you! Wait a
>>>bit, and you'll get what you want then, even across the board!
> 
> 
>>No, obviously that's not what I was saying. But the need for these kinds
>>of domain-specific packaging/metadata formats, each requiring their own
>>tools to work with, would be alleviated if there were simply a more
>>powerful filesystem semantic.
> 
> 
> *Please explain HOW*!! The domain-specific formats /will/ stay (if nothing
> else, because the /domains/ have /specific/ needs), the special tools to
> work with them /will/ have to be written exactly the same (because of the
> above). All for use on /one/ non-standard filesystem.

One filesystem that exists right now.

/proc, as people have made clear, was originally implemented on *one* 
"non-standard" Unix.  Others then copied it.  I see no reason why if 
/meta is a good idea, and programs start using it, that other FSes won't 
implement it.

> Plus exactly the same
> stuff to work on sane filesystems.

"sane" -- I assume you mean "traditional".

Well, yeah.  So?

How big a program do you need to create a new interface to an existing 
system?

Consider:  BitTorrent has at least three interfaces that I can remember 
at the moment.  btdownloadgui.py, btdownloadcurses.py, 
btdownloadheadless.py.

Are you saying that btdownloadgui.py was so much work if you start from 
btdownloadcurses.py that there should be no GTK library, because it 
takes so much work to convert existing curses apps to GTK?

Remember, even if I have GTK installed, I can still get to my curses 
apps, and they may not even know that GTK exists.  Even if I have /meta 
enabled, I can still use my POSIX apps, and they may not even know that 
/meta exists.

>>       So-called 'database-filesystems' ARE coming, whether from
>>Microsoft, Apple, or us.
> 
> 
> IBM did it, long ago (AS/400 and OS/400 ring a bell?). And is now slowly
> moving away from it (and other structured filesystems), AFAICS, towards
> (guess what!) POSIX and Linux...

Linux over POSIX, I think.  Because Linux is big and open-source, not
beacuse POSIX is so great.

> Again, Linux is what it is today in large part because "We have to get
> $FEATURE, because if not, $COMPETITOR will win on us!" arguments have no
> traction.

I agree with that, at least.  But Linux is also what it is today in 
large part because "I don't need $FEATURE, so it should be kept out" 
isn't a particularly good argument either.

