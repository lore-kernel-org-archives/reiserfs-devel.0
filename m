From: Chris Mason <mason@suse.com>
Subject: Re: Errors requiring --rebuild-tree in 2.4.23
Date: Thu, 11 Dec 2003 13:24:41 -0500
Message-ID: <1071167080.10849.127.camel@tiny.suse.com>
References: <br9soe$h0h$1@sea.gmane.org>
	 <1071152521.11147.88.camel@tiny.suse.com>  <bra6s2$9ug$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16334-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <bra6s2$9ug$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Benecke <jens@spamfreemail.de>
Cc: reiserfs-list@namesys.com

On Thu, 2003-12-11 at 11:43, Jens Benecke wrote:
> Chris Mason wrote:
> 
> > On Thu, 2003-12-11 at 08:51, Jens Benecke wrote:
> >> Hi,
> >> 
> >> I posted earlier about quota problems. WE updated to 2.4.23 b ecause of
> >> the logging patches because some power failures made our /home partition
> >> spew out these: (QUESTIONS at the end of the mail)
> > 
> > Sorry, before we got to the questions, what was the order of the events
> > above?
> 
> Oops. I guess I was a bit too confused myself. :)
> 
> 1. Errors on /home in syslog, cron jobs running wild with i/o failures
>      system kept running for a couple days because nobody was there 
>      to fix it, though
>      Those errors were probably caused by power outages and 
>      a non-data-logging ReiserFS kernel.
> 2. Backup what's left of /home to firewire harddisk.
> 3. Update to 2.4.23 with Chris' patches for data logging/quota
> 4. Repartition hda2..4 (was needed anyway for drbd), 
>      reformat new /home (drbd), restore /home on drbd device
> 5. crash of the server overnight, reboot (don't know why yet)

Ok, we need to better understand step 5 here.

> 6. couldn't reboot because root partition was totally b0rken
> 7. reiserfsck --rebuild-tree under Knoppix, killed a couple files
> 8. still running Knoppix, secondary server took over and is running now
> 
> btw: Is there a "reiserfs stress test" kind of thing to make sure a
> configuration works before sending it two time zones away for production? I
> plan on doing that in the next couple weeks. =;)
> Would bonnie++ accomplish this or are there better tests?

The best test is whatever that environment is going to use in
production.  I've got a ton of different scripts that get used based on
different situations, most are ugly hacks.

-chris


