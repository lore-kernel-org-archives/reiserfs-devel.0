From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: A couple of questions
Date: Fri, 17 May 2002 11:05:00 -0400
Message-ID: <ac36a2$o6k$2@main.gmane.org>
References: <OF4AF5C20B.BE2F7D18-ON85256BBB.006643F3@pok.ibm.com> <200205161723.42672.kuba@mareimbrium.org> <20020516214419.GE15774@schmorp.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10362-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020516214419.GE15774@schmorp.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: " ( Marc A. Lehmann )" <pcg@goof.com>
Cc: reiserfs-list@namesys.com

> > What I'm thinking of is this:
> > to the user, which most users w/o intimate filesystem knowledge won't be
> > able to answer at all?
>
> Unix traditionally wasn't aimed at the point-and-click users without
> knowledge.

Yep. But the thing is that either fsck can restore the data or not. There's no 
way in between.

What more can unix-poweruser do about recovering a filesystem, other than 
running a disk editor (say a reiserfs-customized version of norton disk 
editor, which used to be a good thing for hand recovery of fat fs before it 
became crap) ?

What kinds of questions can fsck really ask without having to present user 
with a lot of intricate data, which is better visualized graphically or, at 
least in a more interactive ui?

Example: If e2fsck starts asking questions like "inode counts don't match for 
groups (a long list of groups). fix them <y>", what should I answer? no? that 
would be nonsense.

One of the reasons for these questions are that they are eyebrow-raisers. Say, 
if your raid1 array got out of sync somehow, a lot of fsck errors will maybe 
prompt you to look at whether something like that might have happened in the 
first place. But fsck should be able, as far as it can from the fs metadata, 
tell the user whether the fs was seriously corrupted by a block device 
failure (say raid corruption, hd having transfer problems, etc), overwriting 
of data with garbage, or unclean shutdown / fs-specific kernel bugs. It's the 
fsck utility that has this data. No power admin will have that kind of 
knowledge without at least dumping metadata and having a look at it with some 
specialized tool, or an on-the-spot hacked script to test things out.

I had a hardware crash. Or a raid failure. Obviously I don't have recent 
enough backup, or I really need those last-minute changes back, quickly. Or 
may system crashed in such a way that some metadata got corrupted. Many ifs. 
Now please tell me specifically how that knowledge applies to answering 
particular questions that say ext2fsck or reiserfsck may ask.

> for some strange reason no fsck behaves like that.

Because most fscks are hacks. They are useful, they mostly do their job, but 
they are far from full-features tools, and that's the reality. I don't 
complain. I just say that their functionality isn't optimal, and shouldn't be 
cited as something that's the way to go, or as something that should be a 
design goal. They are effects of how much time did the fs-knowing people have 
to put in them.

Cheers, Kuba
