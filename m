From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 4 Aug 2004 14:41:44 +0200
Message-ID: <20040804144144.2f5fe7b3@philou.gramoulle.local>
References: <200406150022.34578.vitaly@namesys.com>
	<200408031750.00291.vitaly@namesys.com>
	<20040803135805.GK1284@nysv.org>
	<200408031819.51600.vitaly@namesys.com>
	<4110A38A.7040807@namesys.com>
	<20040804095513.GL1284@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19974-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040804095513.GL1284@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com


Hello,

On Wed, 4 Aug 2004 12:55:13 +0300
mjt@nysv.org (Markus T=F6rnqvist) wrote:

  | >These blocks refers to blocks that were used by files and are now back=
up=20
  | >super blocks?  These blocks could be critical database files, etc.?
  |=20
  | Seems to me like yes, but Reiser4 hasn't launched yet officially, so
  | I somehow doubt people will have anything too critical on Reiser4.
  |=20
  | I'm at least preparing myself to take backups of everything.


I completely agree. I really don't mind having another tens of format disk =
change, if it make things better
faster, or cleaner. If people currently use reiser4 in production for missi=
on critical applications, without any backups,
well..., let's say that they had a bet and they lost :)

As Markus said, Reiser4 hasn't been officially released, so i'm all for for=
mat disk change if it improves things in the end
and even if few people might get burnt with that.

Thanks,

Philippe


