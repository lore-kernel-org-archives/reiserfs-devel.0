From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Behavior of tails with respect to shred, wipe, etc
Date: Fri, 25 Oct 2002 19:55:30 +0400
Message-ID: <15801.26994.705639.374241@laputa.namesys.com>
References: <HDEFILEPHCPLCAGPLCEMIELIDFAA.icycle@charter.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11776-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <HDEFILEPHCPLCAGPLCEMIELIDFAA.icycle@charter.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brett Russ <icycle@charter.net>
Cc: Reiserfs-List <reiserfs-list@namesys.com>

Brett Russ writes:
 > Hi,
 > 
 > I have a few questions about the low level functionality of ReiserFS as it
 > pertains to overwriting a file in place from userland.  I am implementing
 > GNU shred on top of Reiser in metadata journaling only mode with tail
 > packing enabled.
 > 
 > To start off, I have several questions:
 > 
 > 1) If I perform an exact file size shred (i.e. the file will not grow or
 > shrink as a result of the shred) of a file with a tail, can I be assured
 > that the write will occur over the existing data in all cases?
 > Specifically, will Reiser allocate a new block to store the overwritten
 > tail, thus abandoning the original data in the original block and defeating
 > the shred attempt?

Tails are stored in leaf nodes of the balanced tree. During balancing
data are copied. When node becomes completely empty it is just dropped
on the floor and disk copy isn't updated. As a result, at any given
moment, some versions of file content can be scattered across different
disk blocks. Moreover, journal area also contains (multiple) copies of
data modified during recent transactions.

 > 
 > 2) If someone confirms that there is not a way to guarantee obliteration of
 > original data in all cases with tails, can I assume that disabling tails
 > will rectify the problem?

I think yes. Reiserfs neither relocates nor journals unformatted blocks
(until data-journalling patches are used).

 > 
 > 3) If I disable tail packing on mount (this is the only way, correct?) how
 > are previously tail packed blocks handled?  I can't imagine that ReiserFS
 > will go through all of them and unpack them--the performance hit of this
 > would be terrible no?  Does this only affect future writes?

Correct.

 > 
 > 4) What is the best way to determine and read the physical sectors that a
 > file is mapped to in order to verify obliteration?  I have used
 > debugreiserfs a bit (with the -d option) and get keys and locations of files
 > but the documentation is rather limited on what all of the output means and
 > how to use it.
 > 

Look for FIBMAP ioctl. It only works for unformatted blocks.

 > 
 > Thanks for your help,
 > Brett

I guess we should address this issue in reiser4. This is -security-
feature after all. Hans? It is not clear how to intehgrate this with
journalling though.

 > 

Nikita.
