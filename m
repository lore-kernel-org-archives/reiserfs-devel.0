From: berthiaume_wayne@emc.com
Subject: RE: Corrupted/unreadable journal: reiser vs. ext3
Date: Tue, 11 Feb 2003 14:43:48 -0500
Message-ID: <93F527C91A6ED411AFE10050040665D0049C06D5@corpusmx1.us.dg.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12686-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk.Schenkewitz@interface-ag.com
Cc: reiserfs-list@namesys.com

	Dirk, I'd be interested in hearing from you your performance
experience with ext3 when it reaches 96% full.
Regards,
Wayne.

-----Original Message-----
From: Dirk Schenkewitz [mailto:Dirk.Schenkewitz@interface-ag.com]
Sent: Tuesday, February 11, 2003 1:59 PM
To: Reiserfs List
Subject: Corrupted/unreadable journal: reiser vs. ext3


Hi Guys,

Recently I read about ReiserFS V4, taking that as a reason to take
a look at ReiserFS again. But I'm not sure if it's worth to switch
from ext3/ext2 to reiser. Because:

More than a year ago, I made up one reiser-partition for playing
around. Well, first there seemed to be nothing special about it.
Then, one day, it suddenly couldn't read its journal anymore,
which prevented the system from booting. (about 2 weeks later I
discovered why: a bad power supply had caused physical damage to
that area of the hard disk) For some reason I don't recall anymore,
I couldn't find a reiserfsck or such. I found no way to get around
the case of a corrupted/unreadable journal.

Luckily, the partition was nearly empty, so I put on an ext3 system
on that partition. That went fine for just a few days, than the bad
disk area (which now held the ext3-journal) decided to strike again.
But guess what happened:
While booting the next time, the ext3 code discovered that the jour-
nal was unreadable (watching that, I thought "oh shit, not again" -
for less than a second), put out a short message stating that and 
that it will continue as ext2. No painfull attempts to recover the
journal - it just dropped it and continued, taking only a few seconds 
for that.
No data was lost! I sat there for some time, staring at the screen,
hardly believing it.

After that, I removed reiser-support from the kernels I used and
since then I only used ext3. If I lost some data since then, it was
only because I accidentally deleted it - there seems to be no way
to recover anything from ext3 (unlike ext2).

Because I have large amounts of data, reliability and solidness of
a filesystem are the most important things to me, then comes space-
efficiency, then speed. Sometimes some of my filesystems get 100%
full, having only some kilobytes left (of, say, 8Gig) until I clean
up. That's my personal situation & experiences.

Now my questions:
From reading the mails from this list, I suspect that a ReiserFS:
 - will sport poor performance (whatever that means, in terms of 
   absolute speed) if it gets more than 96% full. (*1*)
 - will fall far behind ext3 when it comes to reliability, robust-
   ness and crash recovery (at least when fsck is involved), 
 - and will have even more trouble (which may lead to complete fai-
   lure) if the journal cannot be accessed.
Is any of this still true?

(*1*): What if the filesystem contains rather large files, like
       CD-images, MP3s and such, filling it up completely ? Will
       it still slow down?

From what I wrote, you may think that I have some prejudice against
ReiserFS. That's true, I have, because I had a bad experience with
it. Anyway, if you (the developers and/or other people reading here)
can say that nowadays ReiserFS is better than ext3, even under my
personal harsh circumstances, I will give it another try. And now,
feel free to flame me. :-)

happy coding
	dirk
-- 
Dirk Schenkewitz 

InterFace AG                 fon: +49 (0)89 / 610 49 - 126
Leipziger Str. 16            fax: +49 (0)89 / 610 49 - 83
D-82008 Unterhaching         
http://www.interface-ag.de   mailto:dirk.schenkewitz@interface-ag.de
