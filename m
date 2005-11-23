From: Sander <sander@humilis.net>
Subject: Collect data?  (was: Re: More Slowdown or reiser4 update for 2.6.14-mm2)
Date: Wed, 23 Nov 2005 08:09:25 +0100
Message-ID: <20051123070924.GA6951@favonius>
References: <200511171447.41362.mail@earthworm.de> <437CBC63.3050202@namesys.com> <200511172040.39955.mail@earthworm.de> <43820CAD.3090605@namesys.com> <20051121210136.GA25708@favonius> <4383677F.8060106@namesys.com>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27093-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4383677F.8060106@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "E.Gryaznova" <grev@namesys.com>
Cc: sander@humilis.net, "Hesse, Christian" <mail@earthworm.de>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

E.Gryaznova wrote (ao):
> Sander wrote:
> ># echo "foo" > /boot/test
> ># time vim +"s/foo/bar/" +"wq" /boot/test
> >real    0m0.016s
> >user    0m0.000s
> >sys     0m0.000s
> >
> ># echo "foo" > /root/test
> ># time vim +"s/foo/bar/" +"wq" /root/test
> >real    0m9.667s
> >user    0m0.000s
> >sys     0m0.020s
> >
> >/dev/hda2 on / type reiser4 (rw)
> >/dev/hda1 on /boot type ext2 (rw)
>
> Yes, thank you.
> Which iosched do you use?

'deadline':

$ cat /sys/block/hda/queue/scheduler 
noop anticipatory [deadline] cfq 

> Would you please  repeat the vim/reiser4 test for each iosched and
> send us the time values?

As others already reacted with data regarding this test I assume you
don't need my data anymore.

I understand this problem must be quite annoying for the Reiserfs team
as you can't reproduce it. In my case it also only happens on one
system, and not on another.

Maybe we can collect data? I'm happy to set up a page with 'good' and
'bad' configurations. Any suggestions as to what you need?

My 'good' system:
kernel:		2.6.15-rc1-mm2
OS:		Debian Sid
disks:		4x sata on Promise
raid/lvm/etc:	lmv stripe

My 'bad' system:
kernel:		2.6.15-rc1-mm1
OS:		Debian Sid
disks:		ata on nForce2
raid/lvm/etc:	none, single disk

-- 
Humilis IT Services and Solutions
http://www.humilis.net
