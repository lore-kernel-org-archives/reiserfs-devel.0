From: "Brett Russ" <icycle@charter.net>
Subject: % of filesystem using tails/tail unpacking (shred related)
Date: Fri, 25 Oct 2002 17:46:14 -0400
Message-ID: <HDEFILEPHCPLCAGPLCEMKEMFDFAA.icycle@charter.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11787-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs-List <reiserfs-list@namesys.com>

Is there a way to analyze an existing ReiserFS and find out how many of the
blocks are tail packed as opposed to full/partially full from the same file?
This could lead to an impact study of converting it to an unpacked state.

From the information I have received so far, the only way shredding can
reliably work on Reiser, tail packing and data journaling need to be
disabled.  However, existing filesystems using tail packing can not be
simply unpacked to separate blocks without considering the following:

1) as mentioned first, an impact study should be done to determine if
unpacking will overflow the available space on the device

2) an unpack routine would need to be written if it doesn't exist.  With my
current knowledge of Reiser and my timeframe (3 weeks) this is not possible
for me to do IMO.

3) the unpack operation would need to treat the previously packed blocks as
sensitive by shredding them after all tails were relocated but before
returning the block to a free list

4) this operation, depending on the outcome of step 1, would be very
expensive in performance

That's all I can think of right now.  Does this sound accurate?

thanks,
brett


