From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: reiser4 performance
Date: Thu, 11 Aug 2005 17:29:29 -0400
Message-ID: <e692861c05081114294d2a100a@mail.gmail.com>
References: <dd7cbn$kbg$1@sea.gmane.org> <42F7A01A.7090209@namesys.com>
	 <e692861c05080816136f9d70bc@mail.gmail.com>
	 <42F7F6DC.2080706@slaphack.com>
	 <e692861c050808175818078a30@mail.gmail.com>
	 <42F807D7.9090900@slaphack.com>
	 <e692861c05080818551a300f36@mail.gmail.com>
	 <42FB9DD7.6080003@namesys.com> <op.svcxqzsbth1vuj@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25416-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.svcxqzsbth1vuj@localhost>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: PFC <lists@boutiquenumerique.com>
Cc: Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, ReiserFS List <reiserfs-list@namesys.com>

On 8/11/05, PFC <lists@boutiquenumerique.com> wrote:
>=20
> > Well, but then you have to tell postgres that it can assume these thing=
s
> > about reiser4.....
>=20
> you can already set the sync mode in the config file to a llot of
> different choices, like fdatasync, fsync, O_SYNC, etc, so a reiser4 optio=
n
> would be possibel I guess.

Right, and the PostgreSQL team has already shown that they are willing
to create platform specific options.

Could someone familiar with the reiser4 internals provide some
detailed information about what reiser4 currently provides in this
regard?

The specific concerns would be about controlling the ordering and
atomicity of 8k writes and how to tell when they are fixed to the
media.
