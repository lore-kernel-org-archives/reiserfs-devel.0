From: michael chang <thenewme91@gmail.com>
Subject: WinFS beta out
Date: Tue, 30 Aug 2005 22:02:20 -0400
Message-ID: <b14e81f005083019026663f68d@mail.gmail.com>
References: <e692861c0508292136543a02e1@mail.gmail.com>
	 <1125380557.9589.3.camel@gentoo> <4313FE21.8080709@namesys.com>
	 <019d01c5ad68$4d5fdfa0$d60310ac@homedom> <43147EFE.2020804@perkel.com>
	 <b14e81f00508301124ebf9ab9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25740-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00508301124ebf9ab9@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On 8/30/05, Marc Perkel <marc@perkel.com> wrote:
> One think to remember when comparing different file systems is not just
> speed but functionality. Windows has a far better permission system than
> Linux does. ACLs bring Linux closer to Windows when it cones to fine
> grained permissions, but when you turn ACLs on with reiser 3 it slows
> down to 1/10 of normal speed and Reiser 4 ACLs just doesn't work. With
> ACLs as part of the mix ReiserFS would get its butt kicked.
>
> Welcome to the real world.

For administrators on large networks, this makes sense.

Yet, for home users, who like performance w/o the worry for ACLs
(remember FAT?) it seems to me that there is an issue here about who's
targeting whom.

WinFS on Reiser4 would be awesome for home users.  For network
admins... it just might be a big pain, I suppose, without ACLs,
anyways.

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
