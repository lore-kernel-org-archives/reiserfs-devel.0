From: Corey Hickey <bugfood-ml@fatooh.org>
Subject: Re: Problem with reiserfs volume
Date: Mon, 06 Apr 2009 13:04:40 -0700
Message-ID: <49DA6058.7010704@fatooh.org>
References: <20090404172534.YQIW19140.cdptpa-omta03.mail.rr.com@Leslie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=9W6SLZvozUQt
	nG+xw+BtWgH6Bgw=; b=XE6tc7CoHs3jdxyMrGu4PMWwRvr5olbZIx3mMwSQ3i/F
	t2ESgCPZoIbe+FHSc1EOFN00fLWTMYJWHPe6wy4Ge+xMxCbvFO7EC2tLfIsiYl0M
	JkV7KUqmJ26qIDR1EfpjCNsiKZU9j/BF+G7Qf5yNpAtZp007MIJVBCkpkDtYfG4=
In-Reply-To: <20090404172534.YQIW19140.cdptpa-omta03.mail.rr.com@Leslie>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lrhorer@satx.rr.com, reiserfs-devel@vger.kernel.org

Lelsie Rhorer wrote:
> The issue is the entire array will occasionally pause completely for about
> 40 seconds when a file is created.  This does not always happen, but the
> situation is easily reproducible.  The frequency at which the symptom occurs
> seems to be somewhat related to the transfer load on the array.  If no other
> transfers are in process, then the failure seems somewhat more rare, perhaps
> accompanying less than 1 file creation in 10..  During heavy file transfer
> activity, sometimes the system halts with every other file creation.
> Although I have observed many dozens of these events, I have never once
> observed it to happen except when a file creation occurs. 
> Reading and writing existing files never triggers the event, although any
> read or write occurring during the event is halted for the duration. 
> (There is one cron jog which runs every half-hour that creates a tiny file;
> this is the most common failure vector.)  There are other drives formatted
> with other file systems on the machine, but the issue has never been seen on
> any of the other drives.  When the array runs its regularly scheduled health
> check, the problem is much worse.  Not only does it lock up with almost
> every single file creation, but the lock-up time is much longer - sometimes
> in excess of 2 minutes.

This sounds somewhat like an intermittent problem I reported on 2008-02-20:

http://www.spinics.net/lists/reiserfs-devel/msg00702.html

The gist of the issue, apparently, was that writing files would cause
those files to be cached and the kernel would drop reiserfs bitmap data
to make room in the page cache. Once those bitmaps were dropped from the
cache and another file needed to be written, many bitmaps needed to be
read back from the disk in order to find free space. The bitmaps are
small, but spaced every 128 MB, so very many seeks were needed and the
read speed was quite slow.

All that seeking caused the disk to buzz distinctively. Try listening
for that, or looking at the disk read/write activity with something like
dstat.

You can force bitmap data to be dropped and then re-read, in order to
find out what to look/listen for (change sdc4 to md0 or whatever):

# echo 1 > /proc/sys/vm/drop_caches
# debugreiserfs -m /dev/sdc4 > /dev/null

Here's what dstat looks like when I run the above commands:

-------------------
$ dstat -d -D sdc
--dsk/sdc--
 read  writ
 914k  221k
   0    16k
   0     0
   0     0
   0     0
  92k    0
 780k    0
 412k    0
 608k    0
 528k    0
 552k    0
 440k    0
 444k    0
 432k    0
 432k    0
 608k    0
 500k    0
 556k    0
 520k    0
 208k    0
   0     0
   0     0
   0     0
   0     0
-------------------


That might or might not be what's happening to you; my machine had much
less RAM, but also a much smaller array.


Jeff Mahoney was helpful and informative when I reported the issue, but
wasn't able to reproduce it on his system (neither could I, on a machine
with a larger filesystem and less RAM). I ended up switching to ext4 for
the problematic array, but most of my other filesystems are still
reiserfs and have never had that problem.

Good luck,
Corey
