From: Dirk Schenkewitz <Dirk.Schenkewitz@interface-ag.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Fri, 14 Feb 2003 15:20:38 +0100
Message-ID: <3E4CFB36.85B15B4D@interface-ag.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12763-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs List <reiserfs-list@namesys.com>


eazgwmin wrote:

> In article <3E4AA902.86F15815@interface-ag.com>,
> Dirk Schenkewitz  <Dirk.Schenkewitz@interface-ag.com> wrote:
> >For me, it was alarming enough seeing ext3 drop the journal. In fact,
> >THAT was the point where I went to investigate in other directions
> >instead of blaming the filesystem. 
> 
> The kernel block device messages complaining about I/O errors from the
> device aren't sufficient to tell you that there is a serious problem?
> Or was this device silently corrupting data without reporting errors?

Exactly - the kernel didn't report any problems - At least, I did
not notice any.

> >The only problem is, that putting a bad drive to eternal rest
> >might not solve the problem, as long as the REASON for the drive gone
> >bad stays uncovered. (I had that said drive in use for less than 4
> >months (if my memory servers, er, serves my well) - it was like new.
> 
> I've had disks that were DOA (literally--Medium Errors during
> partitioning and mke2fs, followed by mechanical noises and total failure
> in a matter of a few minutes).  I've had several disks that failed a
> week or two after first installation.  

Forgive me: what is DOA?

> The M in MTBF is Mean, not Maximum or Minimum.  For every disk that
> lasts 10 years or more, there's an equal and opposite disk that dies
> within a few minutes.

Yeah, right, I know that. At least, theoretically ;-). I mean,
if a disk drive fails within rather short time, it is most likely
a mechanical defect, and you will hear unusual noises. My drive
produced absolutely normal sounds, not-too-loud spinning noises,
a little stepping noises, you know. And then, it turned out that
no further damage was done after I replaced the power supply...

> >Hans Reiser wrote (in response to Anders Widman):
> >> If we handle the journal block error without downtime, the user will 
> >> never chuck the hard drive, and that is bad in the longterm.
> >
> >Not agreed, unless you continue without a warning.
> 
> I'd prefer to continue in read-only mode, and refuse further read-write
> mounts with an error until the filesystem is fscked.  I really like
> systems that can still boot and let me (attempt to) run diagnostic
> tools even when they're otherwise really unhealthy.

Exactly - that's my humble opinion, too. Just to emphasize it,
If i get told by a program "there is a serious problem here, it will
cost some of my abilities, but I can deal with it for a short time",
then I'm really alarmed. But if I get told, "there is an extremly
serious problem here, and I (*squeak*)...(*silence*)" (u know what
I mean), then I rather think it's a problem of said program.

> I don't care if recently written data is corrupt or missing--I 
> probably didn't write to the diagnostic tools within the last journal 
> interval, and if the filesystem is read-only I can't make any metadata
> corruption worse.

Right. I configured all my ext3 filesystems to remount-ro in case of
error. A kernel panic would not help that much, because you need to
find out what's wrong. Unless there are nasty noises from somewhere,
in which case you still can decide to switch off the machine immediately,
you most likely need a halfway running system to search for the problem
(IMHO).

> I would think that most people notice that something's wrong if they
> can't write to their filesystems any more.  I certainly wouldn't want
> the filesystem to be modified if there's something known to be wrong
> with the metadata.  But if I can't read any of the data at all because
> some tiny part of it is suspicious, I just get annoyed.  :-P

You took the words right out my mouth! ((C) Meatloaf, many years ago)

happy coding
	dirk
-- 
Dirk Schenkewitz 

InterFace AG                 fon: +49 (0)89 / 610 49 - 126
Leipziger Str. 16            fax: +49 (0)89 / 610 49 - 83
D-82008 Unterhaching         
http://www.interface-ag.de   mailto:dirk.schenkewitz@interface-ag.de
