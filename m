From: Bob Vincent <bobvin@pillars.net>
Subject: fsck.reiser4 errors
Date: Tue, 24 Feb 2004 18:41:37 -0500
Message-ID: <20040224234137.GA21990@pillars.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16912-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I've been playing around with reiser4 on a non-critical machine at work,
and managed to corrupt a 20-gig reiser4 partition.

I've run fsck.reiser4 several times to no avail; finally downloaded
and compiled the 2.6.3-internal-testing-going-on version of the utils.

(much later...)

Well, unlike the other versions; this one completed the fsck okay.

Just wondering what the following message means?

  Warning: Can't find stat data extension plugin by its id 0x4.

I see it quite often.

-- 
Robert August Vincent, II
(pronounced "Bob" or "Bob-Vee")
The web is like usenet, but
the elephants are untrained.
