From: Francois-Rene Rideau <fare@tunes.org>
Subject: Re: Crash again!
Date: Wed, 22 Jan 2003 11:03:42 +0100
Sender: Francois-Rene Rideau <fare@Samaris.tunes.org>
Message-ID: <20030122100342.GA14100@hell.mine.nu>
References: <20030118115142.B21932@namesys.com> <20030118100157.C5575@humilis> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115142.B21932@namesys.com> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115724.GA946@Kadath> <20030121213336.GA6756@hell.mine.nu> <20030122065712.D5575@humilis>
Reply-To: Francois-Rene Rideau <fare@tunes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12452-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030122065712.D5575@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ookhoi <ookhoi@humilis.net>
Cc: reiserfs-list@namesys.com

On Wed, Jan 22, 2003 at 06:57:12AM +0100, Ookhoi wrote:
>> Should I try reiserfsck or not?
> That would be the first thing to try :-)
Ok. I tried and it worked. Pphew!
Thanks a lot, once again, for saving the day!
Weird that trying to mount it got stuck with no message,
besides the fact that it was replaying journal for a read-only partition.

>> Should I run to the shop where I sent my previous hardware-crashed
>> disk so that they don't actually send the disk back to manufacturer
>> for exchange?
> A shop will be of no help in this case
OK, I didn't explain well: I had two disks, one being the backup of the oth=
er.
The first disk had hardware damage, so I went to the shop and had it sent
for exchange with the manufacturer. If I lose the second disk to a software
mishap, I ought to run to the shop and tell them to NOT send the disk back
(yet) so I can once again recover the data with dd_rescue.

> PS, in cases like these, I notice a nice warm feeling when I hug my
> backups.
Yup. Everyone should make a daily ritual prayer to Baah-Kuhp,
the God of data preservation.=20
When I had the two disks, I made a daily prayer for my most precious data,
and a weekly prayer for the whole of my data.
One problem with huge disks is that backup solutions that scale
cost quite a lot, and a slow 10Mbps network is quite a slow way to do backu=
ps.

Apparently, the God took revenge that I wasn't enough of a firm believer,
so He made both of my disks fail at once, as a way to teach me a lesson.
Now I believe again.
Be thousand times blessed, oh, Baah-Kuhp, God of data preservation!
Have mercy of me! Though I am a sinner, I promise my faith will be fervent.
I will backup not just to two disks, but to tape, cdrom, remote disk,
and other means. Have mercy, oh misericordious God!

Oh, you unbelievers, open your eyes, and start praying with me!
Baah-Kuhp is a just and merciful god. He saves. He saved me. He will save y=
ou.
But he'll let you rot to hell, if you don't pray Him with fervor and regula=
rity.

[ Fran=E7ois-Ren=E9 =D0VB Rideau | Reflection&Cybernethics | http://fare.tu=
nes.org ]
[  TUNES project for a Free Reflective Computing System  | http://tunes.org=
  ]
"Don't worry about people stealing your ideas.  If your ideas are any good,
you'll have to ram them down people's throats."		-- Howard Aiken
