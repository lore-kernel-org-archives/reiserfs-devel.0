From: "Brett Russ" <icycle@charter.net>
Subject: Behavior of tails with respect to shred, wipe, etc
Date: Fri, 25 Oct 2002 11:40:16 -0400
Message-ID: <HDEFILEPHCPLCAGPLCEMIELIDFAA.icycle@charter.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11775-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs-List <reiserfs-list@namesys.com>

Hi,

I have a few questions about the low level functionality of ReiserFS as it
pertains to overwriting a file in place from userland.  I am implementing
GNU shred on top of Reiser in metadata journaling only mode with tail
packing enabled.

To start off, I have several questions:

1) If I perform an exact file size shred (i.e. the file will not grow or
shrink as a result of the shred) of a file with a tail, can I be assured
that the write will occur over the existing data in all cases?
Specifically, will Reiser allocate a new block to store the overwritten
tail, thus abandoning the original data in the original block and defeating
the shred attempt?

2) If someone confirms that there is not a way to guarantee obliteration of
original data in all cases with tails, can I assume that disabling tails
will rectify the problem?

3) If I disable tail packing on mount (this is the only way, correct?) how
are previously tail packed blocks handled?  I can't imagine that ReiserFS
will go through all of them and unpack them--the performance hit of this
would be terrible no?  Does this only affect future writes?

4) What is the best way to determine and read the physical sectors that a
file is mapped to in order to verify obliteration?  I have used
debugreiserfs a bit (with the -d option) and get keys and locations of files
but the documentation is rather limited on what all of the output means and
how to use it.


Thanks for your help,
Brett

