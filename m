From: Jens Benecke <jens@spamfreemail.de>
Subject: Re: $25 question - ReiserFS 3.6 data errors on 2.4.23
Date: Mon, 01 Mar 2004 13:30:36 +0100
Sender: news <news@sea.gmane.org>
Message-ID: <c1va9o$ahg$1@sea.gmane.org>
References: <20040218093510.GD21098@backtop.namesys.com> <1077098911.5090.38.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16986-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Vladimir Saveliev wrote:

>> Feb 17 14:40:18 linux1 kernel: is_leaf: item location seems wrong (second
>> one): *3.6* [68637 68643 0x1 IND], item_len 8, item_location 1444,
>> free_space(entry_count) 0
>> Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-5150: search_by_key: invalid
>> format found in block 4683374. Fsck?

> These days usually when one notices similar corruptions - he later
> discovers hardware problem (memory problem more often). May I ask you to
> try memtest for some time.
=20
We finally found time to halt one machine and did. memtest86 finds about 150
seemingly random places in RAM where bit errors occur.

It's a wonder that Linux had an uptime of over 90 days with almost flawless
operation on a machine with THAT kind of hopelessly b0rken RAM.

Thank you for being so stubborn about hardware errors. :-)


--=20
Jens Benecke (jens at spamfreemail.de)
http://www.hitchhikers.de - Europaweite kostenlose Mitfahrzentrale
http://www.spamfreemail.de - 100% saubere Postf=E4cher - garantiert!
http://www.rb-hosting.de - PHP ab 9? - SSH ab 19? - g=FCnstiger Traffic
