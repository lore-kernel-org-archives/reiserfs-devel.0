From: Hans Reiser <reiser@namesys.com>
Subject: Re: FIFO files
Date: Tue, 17 Jun 2003 23:30:57 +0400
Message-ID: <3EEF6C71.7060303@namesys.com>
References: <20030617162127.GA14124@chepelov.org> <3EEF40B3.6000300@gmx.net> <20030617170720.GC14124@chepelov.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14591-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030617170720.GC14124@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Cyrille Chepelov <cyrille@chepelov.org>
Cc: reiserfs-list@namesys.com

Cyrille Chepelov wrote:

>Le Tue, Jun 17, 2003, =E0 06:24:19PM +0200, Carl-Daniel Hailfinger a =E9cr=
it:
>
> =20
>
>>This facility has been present in linux for years. Just google for "sparse
>>files".
>>   =20
>>
>
>Yes sparse files would do. However, after a sizeable use of the facility,
>you'd end up with a giant hole at the beginning, whatever queued data, and
>EOF.=20
>What I want to do is the ability to just remove the hole in front (just as
>when there is no point in having a hole at the end of the file, you just
>truncate that hole out), so that seek(SEEK_BEGIN,0) positions me at the
>beginning of useful data (or EOF if my queue is empty).
>
>	-- Cyrille
>
> =20
>
So in answer, yes, this is quite feasible and reasonable to do.  I will=20
be likely to accept such a patch, though you should send a detailed=20
design first to reiserfs-list before writing code.

--=20
Hans


