From: Moritz Franosch <mail@Franosch.org>
Subject: Re: bug: reiserfsck reports "neither new nor old reiserfs format found"
Date: 25 Oct 2002 21:54:01 +0200
Sender: mail@Franosch.org
Message-ID: <m33cqu2t2e.fsf@gateway.askos>
References: <m3n0p23lqn.fsf@gateway.askos>
	<200210251718.29370.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11784-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200210251718.29370.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Vitaly Fertman <vitaly@namesys.com> writes:

> > Thus I've downloaded reiserfsprogs-3.6.3.tar.gz and did
> 
> Please take the last 3.6.4 version of reiserfsprogs.

I've the new version now.

> > reiserfsck --check --logfile check.log /dev/hda2
> >
> > It reported (I've to type from the screen):
> >
> > reiserfs_open: neither new nor old reiserfs format found on /dev/hda2
> > reiserfsck: could not open filesystem on "/dev/hda2"
> 
> Your super block got corrupted somehow or you have your partition table 
> changed so that the blocknumber of the superblock was changed.
> 
> To rebuild the corrupted superblock you can use reiserfsck --rebuild-sb.

Thank you very much for that hint. It's documented in 'man
reiserfsck', but I've overlooked it. I've tried --rebuild-sb but it
reported that it couldn't find the journal. Then I've done

reiserfstune --make-journal-standard

and also experimented with --no-journal-available in various
combinations with --rebuild-sb and --rebuild-tree but I've had no
success.

Thank you very much for your quick reply.


I've never had a single problem I could blame reiserfs for, the only
partition under Linux I've lost so far was an ext2.

But I've the feeling that e2fsck is much simpler: Just execute it and
answer everything with "yes", you don't understand it anyway. Then
your filesystem is either gone or still there and you can look in
lost+found for important data. No need to experiment with
--do-this-and-that --without-doing-that.


Thank you very much again,

Moritz


-- 
Dipl.-Phys. Moritz Franosch
http://Franosch.org
