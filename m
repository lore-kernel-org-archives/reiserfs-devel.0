From: David Masover <ninja@slaphack.com>
Subject: Re: somewhat OT query on journalling
Date: Fri, 21 Jul 2006 16:53:54 -0500
Message-ID: <44C14CF2.4080401@slaphack.com>
References: <20060719152744.GA26155@tranquility.scriptkitchen.com> <44BE95F6.50004@namesys.com> <20060721124518.GA1977@tranquility.scriptkitchen.com> <44C122F1.7000109@slaphack.com> <20060721212611.GA13453@wintermute>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29114-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060721212611.GA13453@wintermute>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Andreas_Sch=E4fer?= <gentryx@gmx.de>
Cc: reiserfs-list@namesys.com

Andreas Sch=E4fer wrote:
>> Don't get too excited -- the transactions probably aren't done yet. With=
out those, no filesystem that claims to journal data is really any better t=
han a filesystem which only journals metadata.  Even once=20
>> they are implemented (or even if they are already), applications have to=
 support them directly.
>=20
> Actually, I think transactions in a filesystem context are a bit
> different from the transactions you know form databases. Generally

Yes, generally speaking, you're entirely right.  But in the case of=20
Reiser4, at least for a single file, you can perform a number of writes=20
and declare them a single transaction.

I believe there are some other oddities, such as:  The FS doesn't always=20
do the rollback, sometimes it delegates to the app for that, and it may=20
be possible to perform transactions on a number of files.  I don't=20
believe transactions imply locking, only serialization -- that is, the=20
last transaction that goes through is the one that counts, and=20
overwrites any transactions that completed before, even if they were=20
started after.  So:

Alice opens foo
Alice starts writing
Bob opens foo
Bob starts writing
Alice writes some more
Bob writes more
Bob closes foo
Alice closes foo

Even though Bob opened foo last, and did the last write, Alice was the=20
last to close a transaction.  If you want to avoid this situation, you=20
use locking.  Locking isn't mandatory, but neither are transactions.

But I could be entirely wrong also.
