From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: where is the journal kept?
Date: Mon, 15 Aug 2005 21:34:56 +0400
Message-ID: <4300D240.7010109@namesys.com>
References: <20050815115310.GA28630@tranquility.scriptkitchen.com>	 <20050815125025.GA29390@tranquility.scriptkitchen.com>	 <43009184.2080201@namesys.com> <200508150812.40382.pat@patdouble.com>	 <4300A603.2050602@namesys.com> <d9a6586e05081509195017d679@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25487-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <d9a6586e05081509195017d679@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Shawn Rutledge <shawn.t.rutledge@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

Shawn Rutledge wrote:
> On 8/15/05, Vladimir V. Saveliev <vs@namesys.com> wrote:
> 
>>Pat Double wrote:
> 
> ...
> 
>>reiser4 has no filesystem area dedicated for journal.
>>Instead it allocats log(journal) records dynamically.
>>
>>it is transactional.
>>
>>>If that's the case, why this option in debug.reiser4 :
>>>
>>>Usage: /sbin/debugfs.reiser4 [ options ] FILE
>>>Print options:
>>>   -j, --print-journal           prints journal.
>>>
>>
>>yes, this prints reiser4 "wandering logs".
> 
> 
> Suppose a new file was being created; when the journal entry for the
> new file actually gets converted to an inode, can it be done without
> rewriting the whole file?
> 
> What if the program was only writing part of the file?  Is journalling
> involved in that?  If so, does it duplicate the whole file?  It
> doesn't duplicate it more than once does it?  (first into the journal,
> then re-write it on the filesystem later)?
> 

When one modifies a filesystem (creat a file or write to a file or anything else)
all blocks are modified in memory. All related changes get in one atom.
When changes are old enough to be flushed to disk - atom commit is called.
Atom commit starts with "flushing". This procedure decides whether changed block gets to relocate of overwrite set.
Blocks of relocate set are written to disk once only. Blocks of relocate set are to written twice: to log and in place.

> What I'm getting at is whether Reiser4 is any better for a flash-based
> filesystem than Reiser3?  I was interested in using it on a CF card in
> my Zaurus, but the guys on the oe list are saying that journalling
> filesystems are bad in general on flash, because they involve
> rewriting the same areas of the flash (where the journal is) over and
> over.  I was thinking that CF and SD cards both use smart block
> allocation so that actually the writes are getting spread around on
> the physical flash memory; but it's still bad if every time you write
> a file, it's getting written 2 or more times. If you have gotten it
> down to just writing the main part of the file once, and then
> re-writing some sort of header from the journal into the "real" fs,
> then the reduction of the life of the flash might be tolerable.
> 

I must be misunderstanding something. Half of reiser4' complexity is about to make disk writes and reads
more sequential to decrease number of hard disk head seeks.
IMHO, filesystem for storage devices which do not have moving mechanical parts can go better without such code.

> The other problem with using it on the Z is that busybox's version of
> mount does not support ReiserFS, so I'd have to compile another
> version for it.  (Not a big problem, but I wonder why busybox doesn't
> support it in the first place.)
> 
> 

