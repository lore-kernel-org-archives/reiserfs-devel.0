From: Chris Mason <mason@suse.com>
Subject: Re: Emergency: Is there a way to fix a partition table
Date: Mon, 27 Sep 2004 13:11:06 -0400
Message-ID: <1096305066.19249.22.camel@watt.suse.com>
References: <231dafb504092622352b9c17d2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21938-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <231dafb504092622352b9c17d2@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dark Shadow <shadowofdarkness@gmail.com>
Cc: reiserfs-list@namesys.com

On Mon, 2004-09-27 at 01:35 -0400, Dark Shadow wrote:
> I don't have a backup of the partition table and was wondering if
> there was a way to auto scan and have it come up with one. It had 2
> partitions both reiserfs v3 and fully functioning Linux installs
> 
> I have made a dd image of the entire drive to work with
> 
> This is very important that I get it fixed since even though I have a
> day old backup I got a couple files I really don't want to lose (9gb
> of tv capturecard captures)and I need the system fully functioning in
> a day

Have you rebooted the system since you lost/overwrote the tables?  A
common cause of this problem is to zero out the partition table by
accident.  If you don't reboot, they are still in kernel ram and can be
retrieved.

-chris


