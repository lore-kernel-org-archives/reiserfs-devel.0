From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Behavior of tails with respect to shred, wipe, etc
Date: Mon, 28 Oct 2002 13:01:51 +0300
Message-ID: <15805.2831.887904.896799@laputa.namesys.com>
References: <15801.26994.705639.374241@laputa.namesys.com>
	<HDEFILEPHCPLCAGPLCEMAEMEDFAA.icycle@charter.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11806-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <HDEFILEPHCPLCAGPLCEMAEMEDFAA.icycle@charter.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brett Russ <icycle@charter.net>
Cc: Reiserfs-List <reiserfs-list@namesys.com>

Brett Russ writes:
 > > Tails are stored in leaf nodes of the balanced tree. During balancing
 > > data are copied. When node becomes completely empty it is just dropped
 > > on the floor and disk copy isn't updated. As a result, at any given
 > > moment, some versions of file content can be scattered across different
 > > disk blocks. Moreover, journal area also contains (multiple) copies of
 > > data modified during recent transactions.
 > 
 > It sounds like I cannot predict when balancing takes place, i.e. it doesn't
 > always occur as a result of writing the file I am concerned about
 > shredding--it might occur as a result of an unrelated operation.  So tails

Right.

 > can and will be scattered about and no longer attached to a shreddable
 > inode...hmm.
 > 
 > Your comment about the journal containing data--does that apply in my case
 > where I am only journaling metadata?

Tails are meta-data: they are journalled.

 > 
 > And if so, wouldn't a write/sync flush through the journal and clear that
 > out?
 > 
 > >  > 2) If someone confirms that there is not a way to guarantee
 > > obliteration of
 > >  > original data in all cases with tails, can I assume that
 > > disabling tails
 > >  > will rectify the problem?
 > >
 > > I think yes. Reiserfs neither relocates nor journals unformatted blocks
 > > (until data-journalling patches are used).
 > 
 > A full block or a partially full block with tail packing disabled is
 > considered an unformatted block?

Not exactly. Distinction between formatted and unformatted is in their
relation to a balanced tree used by reiserfs. Formatted block is the
part of the tree. Formatted block consists of "items". Item has
"type". "Tail" is particular type of an item. Unformatted blocks don't
belong to the tree. Rather, tree contains "indirect items" that store
block number of the corresponding unformatted block. Content of the
tree, including tails and indirect items, is journalled. Parts of the
same file can be stored as tails (within tree) and unformatted blocks
(outside of the tree).

 > 
 > >  > 4) What is the best way to determine and read the physical
 > > sectors that a
 > >  > file is mapped to in order to verify obliteration?  I have used
 > >  > debugreiserfs a bit (with the -d option) and get keys and
 > > locations of files
 > >  > but the documentation is rather limited on what all of the
 > > output means and
 > >  > how to use it.
 > >  >
 > >
 > > Look for FIBMAP ioctl. It only works for unformatted blocks.
 > 
 > Will check it out, thank you.
 > 
 > -Brett
 > 

Nikita.
