From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: jbd layer + reiserfs
Date: Wed, 12 Jun 2002 18:04:13 -0400
Message-ID: <200206121804.13209.kuba@mareimbrium.org>
References: <20020612215110.GA18661@matrix.wg>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10728-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020612215110.GA18661@matrix.wg>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On =B6roda 12 czerwiec 2002 05:51 pm, Dirk Mueller wrote:
> Hi,
>
> just being curious: is reiserfs anywhen going to use the jbd layer that w=
as
> introduced with the ext3 kernel merge ?

I don't think that reiserfs journalling semantics are simple enough to be=20
replicated by a journalled block device... that's my guess, I'm just a user=
,=20
not a developer.

Alas... well, maybe I'm wrong. If instead of opening and closing transactio=
ns=20
in reiserfs journal it would be calling jfs transaction boundaries, maybe=20
it's the same. Does reiserfs do any more magic in its journalling than simp=
ky=20
journal metadata block-writing?

If it would be able to use jbd layer, then I assume some of the journal cod=
e=20
could be put away (ie: dumped), at least in linux kernel tree (is there=20
reiserfs for other platforms at all?).

Cheers, Kuba Ober
