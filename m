From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiserfs rebuild-tree time?
Date: Thu, 11 Mar 2004 12:28:51 +0300
Message-ID: <1078997330.9476.246.camel@tribesman.namesys.com>
References: <Pine.LNX.4.58.0403110111490.1969@web1.mmaero.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17173-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0403110111490.1969@web1.mmaero.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jlewis@lewis.org
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2004-03-11 at 09:27, jlewis@lewis.org wrote:
> I've got a several year old Red Hat 7.0 server with a 70gb partition on
> [adaptec i2o, 5 18gb drive] hardware raid5.  This morning, it crashed, and
> each time someone rebooted it, it would freeze|reboot|panic seconds after
> the bootup process was complete.  It seems this reiserfs partition has
> corruption, which was not properly handled in the older kernel (it's a Red
> Hat 7.0 system).
> 
> I booted it single user and installed the latest 7.3 kernel from the
> fedorlegacy project.  That kernel didn't crash, but instead began logging
> lots of reiserfs corruption warnings, which is actually what alerted us as
> to what the problem was.
> 
> reiserfsck (from reiserfsprogs-3.6.13) found problems and said it could
> not fix them without doing a --rebuild-tree.  So I ran it again with that
> option.  That was about 13 hours ago...and its still running.  I didn't
> think to redirect output to a file, but AFAIK, it's in Pass 3 now.  Lots
> of file names are scrolling by, but only on the last line of my terminal,
> so it's difficult to tell what its up to.
> 
> At this point, I'm wondering how much longer this could possibly take to
> finish?  The partition has about 45gb of files (maildirs, so lots of
> files).  My next question was already answered by the FAQ...regardless of
> the safety of trying it, mounting it ro at this point to try to get to
> some of the files isn't possible.  Am I correct in assuming that stopping
> reiserfsck before the rebuild-tree finishes would be "bad"...i.e. we won't
> be able to access the data, and would have to start over anyway?
> 
Yes


> It seems to be taking an awful long time (hours) scrolling path names
> inside the same user's maildir...so I'm beginning to wonder if it's caught
> in some sort of loop or if this maildir is just huge and its taking time
> to get through.
> 
Yes, this looks like reiserfsck got into endless loop. If it is still
there lets break and fix reiserfsck bug.
For this we need you to do extract filesystem metadata with

debugreiserfs -p /dev/thatdevice | bzip2 -c > metadata.bz2

and allow us to download that file.

> Is there any possibility of getting to the data (most of it anyway) on
> this partition if we have to stop the rebuild before it completes?...i.e.
> if it really is caught in a loop.
> 
> The system is a dual PIII-733.  Other than the rebuild and a few admins
> ssh'd in to keep an eye on it, the system is idle.  I'm not seeing a whole
> lot of activity (1MB/s in, 1MB/5s or so out according to vmstat) and CPU
> idle 98%.  If CPU and disk i/o aren't limiting it, what's causing the
> rebuild-tree to take so long?
> 
> ----------------------------------------------------------------------
>  Jon Lewis *jlewis@lewis.org*|  I route
>  Senior Network Engineer     |  therefore you are
>  Atlantic Net                |
> _________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
> 

