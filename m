From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: % of filesystem using tails/tail unpacking (shred related)
Date: Mon, 28 Oct 2002 12:55:20 +0300
Message-ID: <15805.2440.413201.310382@laputa.namesys.com>
References: <HDEFILEPHCPLCAGPLCEMKEMFDFAA.icycle@charter.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11805-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <HDEFILEPHCPLCAGPLCEMKEMFDFAA.icycle@charter.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brett Russ <icycle@charter.net>
Cc: Reiserfs-List <reiserfs-list@namesys.com>

Brett Russ writes:
 > Is there a way to analyze an existing ReiserFS and find out how many of the
 > blocks are tail packed as opposed to full/partially full from the same file?
 > This could lead to an impact study of converting it to an unpacked state.
 > 
 > >From the information I have received so far, the only way shredding can
 > reliably work on Reiser, tail packing and data journaling need to be
 > disabled.  However, existing filesystems using tail packing can not be
 > simply unpacked to separate blocks without considering the following:
 > 
 > 1) as mentioned first, an impact study should be done to determine if
 > unpacking will overflow the available space on the device

Why cannot you do unpacking just before shredding particular file?

 > 
 > 2) an unpack routine would need to be written if it doesn't exist.  With my
 > current knowledge of Reiser and my timeframe (3 weeks) this is not possible
 > for me to do IMO.

Unpacking can be done through REISERFS_IOC_UNPACK ioctl (see
fs/reiserfs/ioctl.c). One should keep file descriptor open across
ioctl() and shredding for this to work reliably.

 > 
 > 3) the unpack operation would need to treat the previously packed blocks as
 > sensitive by shredding them after all tails were relocated but before
 > returning the block to a free list

ioctl doesn't do this.

 > 
 > 4) this operation, depending on the outcome of step 1, would be very
 > expensive in performance
 > 
 > That's all I can think of right now.  Does this sound accurate?
 > 
 > thanks,
 > brett
 > 

Nikita.

 > 
