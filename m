From: Jens Benecke <jens@spamfreemail.de>
Subject: Re: Errors requiring --rebuild-tree in 2.4.23
Date: Thu, 11 Dec 2003 17:43:45 +0100
Sender: news <news@sea.gmane.org>
Message-ID: <bra6s2$9ug$1@sea.gmane.org>
References: <br9soe$h0h$1@sea.gmane.org> <1071152521.11147.88.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16330-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Chris Mason wrote:

> On Thu, 2003-12-11 at 08:51, Jens Benecke wrote:
>> Hi,
>>=20
>> I posted earlier about quota problems. WE updated to 2.4.23 b ecause of
>> the logging patches because some power failures made our /home partition
>> spew out these: (QUESTIONS at the end of the mail)
>=20
> Sorry, before we got to the questions, what was the order of the events
> above?

Oops. I guess I was a bit too confused myself. :)

1. Errors on /home in syslog, cron jobs running wild with i/o failures
     system kept running for a couple days because nobody was there=20
     to fix it, though
     Those errors were probably caused by power outages and=20
     a non-data-logging ReiserFS kernel.
2. Backup what's left of /home to firewire harddisk.
3. Update to 2.4.23 with Chris' patches for data logging/quota
4. Repartition hda2..4 (was needed anyway for drbd),=20
     reformat new /home (drbd), restore /home on drbd device
5. crash of the server overnight, reboot (don't know why yet)
6. couldn't reboot because root partition was totally b0rken
7. reiserfsck --rebuild-tree under Knoppix, killed a couple files
8. still running Knoppix, secondary server took over and is running now

btw: Is there a "reiserfs stress test" kind of thing to make sure a
configuration works before sending it two time zones away for production? I
plan on doing that in the next couple weeks. =3D;)
Would bonnie++ accomplish this or are there better tests?



--=20
Jens Benecke (jens at spamfreemail.de)
http://www.hitchhikers.de - Europaweite kostenlose Mitfahrzentrale
http://www.spamfreemail.de - 100% saubere Postf=E4cher - garantiert!
http://www.rb-hosting.de - PHP ab 9? - SSH ab 19? - g=FCnstiger Traffic

