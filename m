From: Jens Benecke <jens@spamfreemail.de>
Subject: Re: $25 question - ReiserFS 3.6 data errors on 2.4.23
Date: Wed, 18 Feb 2004 11:32:10 +0100
Sender: news <news@sea.gmane.org>
Message-ID: <c0verm$ps6$1@sea.gmane.org>
References: <20040218093510.GD21098@backtop.namesys.com> <1077098911.5090.38.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16826-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Vladimir Saveliev wrote:

> Hello

Hi,

thanks for your answer.
=20
>> Feb 17 14:40:18 linux1 kernel: is_leaf: item location seems wrong (second
>> one): *3.6* [68637 68643 0x1 IND], item_len 8, item_location 1444,
>> free_space(entry_count) 0
>> Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-5150: search_by_key: invalid
>> format found in block 4683374. Fsck?
>=20
> These days usually when one notices similar corruptions - he later
> discovers hardware problem (memory problem more often). May I ask you to
> try memtest for some time.

We did, we even exchanged memory, it happened again.
=20
> Does linux1 have other reiserfs filesystem with similar loads?

Only the root file system.=20
There is only / and /home on this machine, and / never had any problems.

> Can you switch machine linux1 with other machine which runs flawlessly
> currently?

We actually bought new ones now. When they are running fine we'll be able to
take the old ones and investigate more thoroughly.
But that'll probably take some more weeks, because I don't have time to do
the setup on the new machines ATM. (diploma thesis :)

> Then if that machine will get filesystem corruptions - then we probably
> have a bug which comes up on the load linux1 is currently running under.
> If it will work well - than linux1 is probably not very reliable.

Well... it's a K6-350 with 128MB about six years old. With new RAM and new
harddisks though. (IBM 120GB)


--=20
Jens Benecke (jens at spamfreemail.de)
http://www.hitchhikers.de - Europaweite kostenlose Mitfahrzentrale
http://www.spamfreemail.de - 100% saubere Postf=E4cher - garantiert!
http://www.rb-hosting.de - PHP ab 9? - SSH ab 19? - g=FCnstiger Traffic
