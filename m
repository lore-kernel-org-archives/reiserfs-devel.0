From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: lvm array --> what if one HD fails
Date: Mon, 22 Jul 2002 08:20:57 -0400
Message-ID: <200207220820.57227.kuba@mareimbrium.org>
References: <5.0.2.1.2.20020722111528.01cf4640@pop.tvnet.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11069-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <5.0.2.1.2.20020722111528.01cf4640@pop.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Newsmail <newsmail@satimex.tvnet.hu>
Cc: reiserfs-list@namesys.com

On poniedzia=B3ek 22 lipiec 2002 07:19 am, Newsmail wrote:
> I have an lvm array with many HDs one after the other. it is a simple
> linear array, no striping. what happens if one HD dies and I remove it fr=
om
> the array? could reiserfsck correct this? what happens to the metadata? as
> I know it lies all over the space because of the tree structure. could th=
is
> be corrected? :)

AFAIK it can be corrected - replace the HD and set LVM so that the missing =

chunk gets back there, although now with invalid data. Make sure that the=20
chunk you insert is zeroed, otherwise, IIRC, reiserfck can do weird things.=
=20
Then run reiserfsck --rebuild tree. In a similar situation, it helped me=20
recover everything but the missing chunk + a little stuff adjacent to it.

Cheers, Kuba Ober
