From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: ReiserFS corruption with samba 3.0.2a
Date: Wed, 18 Feb 2004 15:08:19 +0100
Message-ID: <Sea2-DAV57V87PdIv650000b53f@hotmail.com>
References: <Sea2-DAV22IBirXXeQM0000aeb5@hotmail.com> <16435.27477.679757.404161@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16830-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: linux-kernel@vger.kernel.org, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Nikita Danilov wrote:

> Marco Berizzi writes:
>  > Hello.
>  >=20
>  > I'm experimenting this problem with samba 3.0.2a and linux 2.4.24
>  > with ReiserFS. When I copy (put) a large file (5GB) from a Windows =
NT
>  > terminal server edition sp6a machine to the samba-linux box I get =
this
>  > error:
>  >=20
>  > Feb 17 18:01:11 Mimas kernel: ide0(3,8):vs-4080: =
reiserfs_free_block: free_block (0308:4999052)[dev:blocknr]: bit already =
cleared
>  > Feb 17 18:01:11 Mimas kernel: ide0(3,8):vs-4080: =
reiserfs_free_block: free_block (0308:4997935)[dev:blocknr]: bit already =
cleared
>  > Feb 17 18:02:48 Mimas kernel: ide0(3,8):vs-4080: =
reiserfs_free_block: free_block (0308:902445)[dev:blocknr]: bit already =
cleared
>  > Feb 17 18:02:48 Mimas kernel: ide0(3,8):vs-4080: =
reiserfs_free_block: free_block (0308:902286)[dev:blocknr]: bit already =
cleared
>  >=20
>=20
> Are there any other error messages before these?

No, no errors before these.

>  > Samba 2.2.8a doesn't show this behaviour.
>  >=20
>  > The linux box is Slackware 9.1 (gcc 3.2.3 linux 2.4.24 glibc =
2.3.2).
>  > It's easy for me to reproduce the problem.
>  >=20
>  > Hints?
>=20
> Did target file exist before copy?

No. The directory was clean.
