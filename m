From: Jens Benecke <jens@spamfreemail.de>
Subject: Re: data-logging 2.4.23 patches: 1 reject in fs/inode.c in 2.4.25
Date: Mon, 23 Feb 2004 14:29:20 +0100
Sender: news <news@sea.gmane.org>
Message-ID: <c1cv3s$iqi$1@sea.gmane.org>
References: <c12ap7$vor$1@sea.gmane.org> <1077304113.26934.8.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16887-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Chris Mason wrote:

> On Thu, 2004-02-19 at 07:40, Jens Benecke wrote:
>> Hi,
>>=20
>> Chris' data-logging patches do not apply cleanly to 2.4.25, are they
>> being updated?
>>=20
>> I think the fix for inode.c is not very hard but I don't dare to fiddle
>> around with file system code. ;)
>=20
> Ok, I'll rediff the data logging + quota against 2.4.25.

Chris,

that would be great!=20
I have some software that depends on 2.4.x for the time being, I cannot
upgrade yet. (drbd for example)

Thank you!


--=20
Jens Benecke (jens at spamfreemail.de)
http://www.hitchhikers.de - Europaweite kostenlose Mitfahrzentrale
http://www.spamfreemail.de - 100% saubere Postf=E4cher - garantiert!
http://www.rb-hosting.de - PHP ab 9? - SSH ab 19? - g=FCnstiger Traffic
