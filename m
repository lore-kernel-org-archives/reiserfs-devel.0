From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Problem with my HDD
Date: Fri, 31 May 2002 18:28:27 +0200
Message-ID: <200205311828.27837.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10469-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Billy Transue <bill@black9.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Friday 31 May 2002 04:20,  Billy Transue wrote:

[-]
> I've suffered a very similar problem and posted to the list earlier, I
> did, dd_resuce -l dd.log /dev/hdd5 ./hdd5 and winded up w/ this:
> dd_rescue: (info): ipos:         0.0k, opos:         0.0k,
> xferd:         0.0k
>                    errs:      0, errxfer:         0.0k,
> succxfer:         0.0k
>              +curr.rate:        0kB/s, avg.rate:        0kB/s,
> avg.load:  0.0%
>
> it never changed, the file created hdd5 was 65536 bytes large.  The log
> file was empty.  Am I doing something wrong?  Any info would be
> appreciated.  Thanks in advance.

Bill, have you ever tried the (r)evers mode?
A valid run on a 859.412k partition should look like this:

SunWave1 /tmp# time dd_rescue -r -l dd_rescue-sdb8.log /dev/sdb8 sdb8
dd_rescue: (info): ipos:    859446.0k, opos:    859446.0k, xferd:         0=
.0k
             -  *  errs:      0, errxfer:         0.0k, succxfer:         0=
.0k
             +curr.rate:        0kB/s, avg.rate:        0kB/s, avg.load: 96=
.1%
dd_rescue: (warning): /dev/sdb8 (859446.0k): Input/output error!
dd_rescue: (info): ipos:    859445.5k, opos:    859445.5k, xferd:         0=
.5k
             -  *  errs:      1, errxfer:         0.5k, succxfer:         0=
.0k
             +curr.rate:      197kB/s, avg.rate:        0kB/s, avg.load: 96=
.0%
dd_rescue: (warning): /dev/sdb8 (859445.5k): Input/output error!
dd_rescue: (info): ipos:    859445.0k, opos:    859445.0k, xferd:         1=
.0k
             -  *  errs:      2, errxfer:         1.0k, succxfer:         0=
.0k
             +curr.rate:      252kB/s, avg.rate:        0kB/s, avg.load: 95=
.9%
dd_rescue: (warning): /dev/sdb8 (859445.0k): Input/output error!
dd_rescue: (info): ipos:    859444.5k, opos:    859444.5k, xferd:         1=
.5k
             -  *  errs:      3, errxfer:         1.5k, succxfer:         0=
.0k
             +curr.rate:      261kB/s, avg.rate:        1kB/s, avg.load: 95=
.8%
dd_rescue: (warning): /dev/sdb8 (859444.5k): Input/output error!
dd_rescue: (info): ipos:        54.0k, opos:        54.0k, xferd:    859392=
.0k
             -     errs:      4, errxfer:         2.0k, succxfer:    859390=
.0k
             +curr.rate:     2413kB/s, avg.rate:     2219kB/s, avg.load:  4=
.5%
Summary for /dev/sdb8 -> sdb8:
dd_rescue: (info): ipos:         0.0k, opos:         0.0k, xferd:    859446=
.0k
             -     errs:      4, errxfer:         2.0k, succxfer:    859444=
.0k
             +curr.rate:     2201kB/s, avg.rate:     2217kB/s, avg.load:  4=
.5%
0.530u 16.960s 6:27.67 4.5%     0+0k 0+0io 122pf+0w

SunWave1 /tmp# l dd_rescue-sdb8.log sdb8
-rw-r-----    1 root     root         1713 Mai 31 18:15 dd_rescue-sdb8.log
-rw-r-----    1 root     root     880072704 Mai 31 18:15 sdb8

Are you sure that you had write permission and enough space (!!!) on your=20
destination (in your case the current working directory)?

dd_rescue seems to allocate the whole needed disk space at the beginning!

Good luck!

-Dieter

BTW I've had "recovered" several (Winbloze) disks of our customers with=20
dd_rescue. But *nix FSes are much better to recover because of the better F=
S=20
redundancy and fsck tools after the dd_rescue run.

--=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel@hamburg.de
