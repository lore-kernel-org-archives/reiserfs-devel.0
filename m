From: Jens Benecke <jens@spamfreemail.de>
Subject: Re: $25 question - ReiserFS 3.6 data errors on 2.4.23
Date: Wed, 18 Feb 2004 14:42:08 +0100
Sender: news <news@sea.gmane.org>
Message-ID: <c0vpvs$lir$1@sea.gmane.org>
References: <20040218093510.GD21098@backtop.namesys.com> <1077098911.5090.38.camel@tribesman.namesys.com> <c0verm$ps6$1@sea.gmane.org> <40336855.1030400@dsvr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16828-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Nick Burrett wrote:

>=20
>=20
> Jens Benecke wrote:
>> Vladimir Saveliev wrote:
>>>>Feb 17 14:40:18 linux1 kernel: is_leaf: item location seems wrong
>>>>(second one): *3.6* [68637 68643 0x1 IND], item_len 8, item_location
>>>>1444, free_space(entry_count) 0
>>>>Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-5150: search_by_key:
>>>>invalid format found in block 4683374. Fsck?
>>>
>>>These days usually when one notices similar corruptions - he later
>>>discovers hardware problem (memory problem more often). May I ask you to
>>>try memtest for some time.
>> We did, we even exchanged memory, it happened again.
=20
> This reminds me of a similar problem that we experienced across several
> of our servers.  It turned out that an upgrade from reiserfsprogs 3.6.8
> to 3.6.11 changed the status result codes of 'reiserfsck' meaning that
> our scripts failed to detect that '--check' was reporting that we should
> also run '--fix-fixable'.

Well, the last time we had these problems it required a --rebuild-tree. I
hope it's not the same this time.

And we don't run reiserfsck at boot time, only manually. ("0 0" in fstab)
=20

--=20
Jens Benecke (jens at spamfreemail.de)
http://www.hitchhikers.de - Europaweite kostenlose Mitfahrzentrale
http://www.spamfreemail.de - 100% saubere Postf=E4cher - garantiert!
http://www.rb-hosting.de - PHP ab 9? - SSH ab 19? - g=FCnstiger Traffic
