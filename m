From: Sander <sander@humilis.net>
Subject: Re: Collect data?
Date: Wed, 23 Nov 2005 11:15:36 +0100
Message-ID: <20051123101536.GA26086@favonius>
References: <200511171447.41362.mail@earthworm.de> <437CBC63.3050202@namesys.com> <200511172040.39955.mail@earthworm.de> <43820CAD.3090605@namesys.com> <20051121210136.GA25708@favonius> <4383677F.8060106@namesys.com> <20051123070924.GA6951@favonius> <43843F36.5050907@namesys.com>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27099-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43843F36.5050907@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "E.Gryaznova" <grev@namesys.com>
Cc: sander@humilis.net, Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

E.Gryaznova wrote (ao):
> Sander wrote:
> >E.Gryaznova wrote (ao):
> >>Would you please  repeat the vim/reiser4 test for each iosched and
> >>send us the time values?
> >
> >As others already reacted with data regarding this test I assume you
> >don't need my data anymore.
>
> not right. We _need_ your data for "bad" system.

Oke, more than happy to comply :-)

Please let me know if you need me to do additional tests.


> >My 'bad' system:
> >kernel:		2.6.15-rc1-mm1
> >OS:		Debian Sid
> >disks:		ata on nForce2
> >raid/lvm/etc:	none, single disk

for i in `seq 4`; do for i in cfq noop anticipatory deadline; do echo $i > /sys/block/hda/queue/scheduler; cat /sys/block/hda/queue/scheduler; echo "foo" > test && time vim +"s/foo/bar/" +"wq" test &> /dev/null ; done; done

noop anticipatory deadline [cfq]

real    0m7.792s
user    0m0.000s
sys     0m0.000s
[noop] anticipatory deadline cfq

real    0m4.038s
user    0m0.000s
sys     0m0.010s
noop [anticipatory] deadline cfq

real    0m5.466s
user    0m0.000s
sys     0m0.000s
noop anticipatory [deadline] cfq

real    0m5.832s
user    0m0.000s
sys     0m0.000s

===
noop anticipatory deadline [cfq]

real    0m6.782s
user    0m0.000s
sys     0m0.000s
[noop] anticipatory deadline cfq

real    0m8.415s
user    0m0.010s
sys     0m0.010s
noop [anticipatory] deadline cfq

real    0m6.757s
user    0m0.000s
sys     0m0.030s
noop anticipatory [deadline] cfq

real    0m8.538s
user    0m0.000s
sys     0m0.030s

===
noop anticipatory deadline [cfq]

real    0m10.118s
user    0m0.000s
sys     0m0.010s
[noop] anticipatory deadline cfq

real    0m8.429s
user    0m0.000s
sys     0m0.020s
noop [anticipatory] deadline cfq 

real    0m10.497s
user    0m0.000s
sys     0m0.000s
noop anticipatory [deadline] cfq 

real    0m10.434s
user    0m0.000s
sys     0m0.010s

===
noop anticipatory deadline [cfq] 

real    0m9.196s
user    0m0.000s
sys     0m0.030s
[noop] anticipatory deadline cfq 

real    0m9.298s
user    0m0.000s
sys     0m0.010s
noop [anticipatory] deadline cfq 

real    0m11.268s
user    0m0.000s
sys     0m0.040s
noop anticipatory [deadline] cfq 

real    0m8.034s
user    0m0.000s
sys     0m0.040s

-- 
Humilis IT Services and Solutions
http://www.humilis.net
