From: Anders Widman <andewid@tnonline.net>
Subject: Re: Optimizing power usage!?
Date: Thu, 19 Sep 2002 09:47:37 +0200
Message-ID: <33176516890.20020919094737@tnonline.net>
References: <1032380903.16005.74.camel@ryans2.desktop.amazon.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11509-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1032380903.16005.74.camel@ryans2.desktop.amazon.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ryan Snodgrass <rsnodgrass@usa.net>
Cc: reiserfs-list@namesys.com

> Most messages on this forum have focused on optimizing performance,
> however I'm looking for suggestions in an effort to reduce power
> consumption on the 1.2TB RAID servers we run.

> The boxes are mostly used for archiving huge amounts of data and only
> see usage for a third of the day at most.  They are setup with a 7500-8
> with 8 Maxtor 160GB drives plus IDE boot drive and CDROM.  They are
> running RedHat Linux 7.3 with ReiserFS filesystem and Samba shared
> mounts.

> The plan is:

> * Enable power saving options in BIOS for on-board IDE bus and CPU
> * Does 3ware support powering down drives during period of inactivity?

You  could use "hdparm -Sxxx /dev/hdx" to set the spin-down time outs.
-S242  would  set  the timeout to 1 hour. The man page says:


       -S     Set  the  standby (spindown) timeout for the drive.
              This value is used by the drive  to  determine  how
              long to wait (with no disk activity) before turning
              off the spindle motor to save  power.   Under  such
              circumstances,  the  drive  may  take as long as 30
              seconds to respond to  a  subsequent  disk  access,
              though  most drives are much quicker.  The encoding
              of the timeout value is somewhat peculiar.  A value
              of  zero means "off".  Values from 1 to 240 specify
              multiples of 5 seconds, for timeouts from 5 seconds
              to 20 minutes.  Values from 241 to 251 specify from
              1 to 11 units of 30 minutes, for timeouts  from  30
              minutes  to  5.5 hours.  A value of 252 signifies a
              timeout of 21 minutes, 253  sets  a  vendor-defined
              timeout,  and 255 is interpreted as 21 minutes plus
              15 seconds.

This should work on most drives, including SCSI type.

Also,  for the CPU, you can compile the kernel with the APM driver and
enable the "hlt" instruction. That will save power too.

If  you  have  a  newer  type  of  system you can use the the S3 (STR)
power-save  mode.  STR, or Suspend To Ram, is quite efficient. I think
you  should be down to a few Watts when the system is in STR mode. It
is quick to resume from.

 - Anders


> Are there any other options?  Obviously I could have the machines power
> down at night...the tricky thing is getting them to boot back at a
> specific time each day.  I can't remember if the BIOS in those boxes
> have that option or not, I'll investigate.

> The shutdown would need to occur from Linux to make sure everything was
> shutdown cleanly.

> Any other suggestions?  Saving ~ 60% on electricity charges is
> definately a win when you have several of these boxes running.

> Thanks,
> Ryan

