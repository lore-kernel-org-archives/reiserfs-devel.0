From: "darren" <teodarren@myrealbox.com>
Subject: Raid5, LVM and Reiserfs
Date: Sun, 20 Oct 2002 07:47:50 +0800
Message-ID: <000701c277c9$ef8d6c70$0101a8c0@bummer>
References: <3DB0239C.2050409@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11724-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DB0239C.2050409@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all,

I got 5 pieces of 72GB SCSI harddisk that I would like to implement
raid5 with reiserfs with.

This is the first time I am configuring my linux box on a non-pc (this
is a dell poweredge server), and I figure I should get some advise
first.

Due to the bad performance (or so I heard on google) of the hardware
raid controller, I would like to use software raid5. 

I need on RedHat 7.3 with 2.4.19:

1)	Software RAID5 (any recommended settings?)

2)	Reiserfs (how do I make reiser over raid?)

3) 	I was told I need LVM too??

Any advise abt how I should go about this?

Thanx in advance
Darren

