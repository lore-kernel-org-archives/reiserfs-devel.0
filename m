From: Michael James <Michael.James@csiro.au>
Subject: Reiser4 support in Suse9.3
Date: Mon, 16 May 2005 17:21:02 +1000
Message-ID: <200505161721.02806.Michael.James@csiro.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24061-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

What is the status of the reiser4 built into Suse9.3?

I tried reiser4 back in suse9.2
 and could mkfs.reiser4 a partition and mount it
 but the machine hung when I hit it with a big rsync.

Nothing seemed to be happening to update reiser4progs either.

Now SuSE9.3 comes with  reiser4progs-1.0.3-3
 built on 20/3/5  (note little-endian date, not middle-endian)
 seems up-to-date enough but same result.

Format OK, mount OK,
 but use leads to a hang for the copying process,
 and any process that follows it in to see what happened.

I think it relates to big files (>2Gig) being present...
I could test more if you like,
michaelj


-- 
Michael James                         michael.james@csiro.au
System Administrator                    voice:  02 6246 5040
CSIRO Bioinformatics Facility             fax:  02 6246 5166

Internet Explorer is fine for downloading Firefox,
 but after that....
