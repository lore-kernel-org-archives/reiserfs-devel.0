From: Todd Lyons <volleyball@mrball.net>
Subject: Re: reiserfsck aborts in pass1
Date: Thu, 2 May 2002 23:24:02 -0700
Message-ID: <20020502232402.D20383@mrball.net>
References: <1020349828.915.69.camel@vorab> <200205021454.g42Es9n25735@arm.mrball.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10218-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200205021454.g42Es9n25735@arm.mrball.net>; from vitaly@namesys.com on Thu, May 02, 2002 at 06:53:13PM +0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Vitaly Fertman wanted us to know:

>debugreiserfs -p /dev/sdb1 | bzip2 -c > sdb_metadata.bz2 
>and put the metadata somewhere for downloading. I will check how
>the latest fsck will work for your case.

Stupid question time.  What steps do you do on your end to check a
metadata dump that somebody provides to you?  Just curious.
-- 
Blue skies...	Todd                   http://www.mrball.net
       Public key:  http://www.mrball.net/todd.asc
     There are only 10 types of people in this world.
     Those who understand binary and those who don't.
