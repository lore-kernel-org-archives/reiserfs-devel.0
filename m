From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: A couple of questions
Date: Fri, 17 May 2002 11:35:57 -0400
Message-ID: <200205171135.57105.kuba@mareimbrium.org>
References: <OF4AF5C20B.BE2F7D18-ON85256BBB.006643F3@pok.ibm.com> <200205161723.42672.kuba@mareimbrium.org> <200205171310.g4HDAgmD005059@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10365-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200205171310.g4HDAgmD005059@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> > Why on earth does a filesystem check & recovery program need to ask
> > questions to the user, which most users w/o intimate filesystem knowledge
> > won't be able to answer at all? Looking at this list, what people want is
> > to get their data back, as much as possible. They never want to get less
> > than that. Why bother asking?
>
> Well.. at least "traditionally", it was possible for a filesystem to get
> scrozzled in ways that just saying 'y' would result in more data loss than
> one judicious 'n' at the wrong time.  There's been more than once in the
> last two decades that I've had  fsck dropping zillions of files into
> lost+found/ because it decided that they were in invalid directories.
>
> Why were those directories invalid? Because their .. pointers were broken.
>
> What was wrong with their .. pointers?  They pointed at a directory that
> had a bum .. as well...
>
> End result?  If you answered 'n' to all the "relink?" questions *except*
> for the one actual broken one, you ended up with an almost-intact directory
> tree in lost+found, and a simple 'mv #004 ../real_name' would finish it,
> rather than 3 zillion #nnnn entries with no directory structure at all.

That's an fsck problem. Fsck has enough data to make sure that directories are 
really correct. That particular fsck you're mentioning didn't do its job, 
that's all.

As far as the pointers are concerned, what kinds of directory pointers you're 
referring to? Pointers from lower-level directories that didn't point to the 
directory in question, pointers from broken lower-level dirs that point to 
directory in question, pointers from that directory entry to some other 
broken directory?

Please explain the pointer thing and say explicitly what points to what and 
why they were broken. I'd really like to know, as I'm putting down an 
idea-list if I'd ever feel like making a useable disk-editor thingo that 
would support different linux fsms.

> The ugliest one of these was on a system where fsck refused to grow
> lost+found (because doing so would require more blocks - which are hard to
> get if you can't trust the free list at the moment - that's why old mkfs
> commands would have a loop that touched a bunch of files in lost+found and
> then rm them - just to grow the directory size).
>
> So quite often, you'd end up doing an 'fsck -n' once to figure out what was
> scrogged, then re-run it several times, answering 'y' to things in the
> right order...

Again, that looks like fsck was broken and not doing its job. Please say what 
kind of info the fsck was providing to you with fsck -n, and how did you use 
that info to answer 'y' in the right order. I assume that:
1. the fsck will be able to answer most of these questions if it had code to 
do it,
2. the only leftover questions would be those that would have to be asked 
anyway -- if we'll make users not answer questions when they don't need to, 
they will learn to answer the important ones.

Please tell me which one of these would you rather see?
- "invalid block counts in groups (blah, lists inodes in groups), fix them?"
- "inode x had zero dtime, fixed"
- or "your fs seems to have suffered corruption that's typical to shutting 
down an fs without properly unmounting it first, corrected."
(that's somewhat generalizing, and based on e2fs)

Cheers, Kuba
