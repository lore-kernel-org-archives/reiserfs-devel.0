From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: A couple of questions
Date: Fri, 17 May 2002 11:21:16 -0400
Message-ID: <200205171121.16436.kuba@mareimbrium.org>
References: <OF4AF5C20B.BE2F7D18-ON85256BBB.006643F3@pok.ibm.com> <3CE4476E.8070101@namesys.com> <200205170048.g4H0mI402129@linux1.futureware.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10363-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200205170048.g4H0mI402129@linux1.futureware.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> > I am a filesystems developer, and I don't know enough to do more than
> > press y with most fscks.
>
> There is one case, in which I know that I have to say no: If the partition
> that a fsck tries to correct has a different type than the fsck thinks.
> (Running e2fsck against a reiserfs partition for example)

These are obvious cases and I don't oppose asking in those cases. That makes 
sense. This is actually a case when the user/sysadmin can provide meaningful 
input to the fsck. But asking questions which reduce to "are you sure you 
want me (fsck) to do as much as I can to bring it back" are pointless.

> > I think that for the most part, if one is
> > going to ask the user to help, one needs to provide a real interface, a
> > filesystem structure editor.....
>
> Well, debugfs (ext2) was an approach into that direction, isn't it?
> Now I stumbled across debugreiserfs, but it lacks interactive mode.

We need at least as much functionality as norton disk editor had wrt fat 
partition fixing. Anything less is a waste of time.

> > which no FS has ever done....  but
> > right now we need to get what we have debugged thoroughly.  It is on the
> > list of things I would like to add someday.
>
> What I would like to see is a tool to do the following:
> (And I don't think that I will find a sponsor for that tool :-(
>
> After a crash, I make a dd from the crashed partition, into a normal file
> in another partition, that's perhaps on a differnt harddisk.

That's only needed sometimes, like when your source partition is failing. An 
fsck can warn that "there are read errors while accessing this partition, 
advice making binary copy and working on that".

Otherwise, typically the amount of changed bits that fsck actually changes to 
fix things is minor. Restore files are not such a bad idea, you know, 
especially that they are easy to implement (just journal all changes in a 
file, including previous data).

> Then I want to run a dumping utility, that tries to restore every bit that
> still can be found in the crashed partition, and tries to resemble all the
> files in it, and even creating a lost&found directory ...
>
> That dumping utility should take an output directory as argument, in which
> it recreates the contents.
>
> Something like "The Coroners Kit", but more for recovery than for
> investigation.
>
> What is important for that tool:
> * It must not crash under any circumstances. Even if every bit of the
> filesystem is currupted, it has to do its work, and try to recover as much
> as possible.
> * It has to assume that every bit of the filesystem can be corrupt, so it
> has to try to semantically verify the bits, pointers, ...
> * It should try different ways to restore access to lost data, if it
> stumbles across problems in the filesystems.
> * There must not be any assertions that would not allow the tool to run
> over the whole partiton, and search everywhere for lost data
> * It has to be designed to work on files which are dumps from partition
> based filesystems.
> * It should be able to detect and correct common hardware or crash related
> problems in the filesystem:
>   * Files that are not statable or accessible, because there only exists an
> entry in the directory, but nothing in the reiserfs tree
>   * Transactions that are open
>   * Corrupted directory entries like filenames with special charakters that
> can not be used from the system, or rights with undefined bits, ...
>   * ...
> * It must not change any data on the partition, instead it writes
> everything to an output directory

reiterating
1. It doesn't need to work on the real partition. There are many ways 
(implementations) it can work without writing to it, not even the metadata.
2. It should try to "tick-check" any correct data asap, so as to limit the 
search area for corrupted leftovers
3. It should basically leave corrupted data until it is done with all 
non-corrupted stuff. Typical fs corruptions are tiny, tiny, tiny.
4. Hardware problems are basically "underlying-block-device" problems. 
Sometimes things fail without hardware failing, like bugs in raid stuff, etc. 
This is basically a heuristic pattern detection stuff: if things are borked 
in a certain pattern, we can assume that the block device has problems.

A lot of stuff in such a tool would be fs-independent, like filename 
verificator (that would give a probability that a given string was a 
filename), etc. Anyway, the point of this exercise is to make a tool which 
can have a decent frontend, and which actually can ask meaningful questions 
that the user can answer. On many server systems, the admin is reasonably 
able to answer a question about say whether this directory was something he 
hasn't seen, or something that he has been working on a lot lately, etc. This 
requires maybe kind of an expert-system approach. Well, that's too much of a 
buzzword, but it boils down to very simple things: it needs to find out as 
many correct things about the filesystem (those that leave little doubt) as 
it can, and treat them as assertions, and then it can ask a few decent 
questions that  will make the recovery possible. Again, a lot of fs 
corruption is pretty much limited. Say if for some reason all the superblocks 
have been overwritten, it should first try assuming that these were generated 
by the most recent mkfs with default options, and then try a few different 
possible options, progressing to uncommon ones, etc. That's the approach to 
the problem as I see it. Rants and flames welcome.

Cheers, Kuba Ober
