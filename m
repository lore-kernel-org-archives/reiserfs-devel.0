From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@go2.pl>
Subject: Re: too many iterations - Reiser 4
Date: Tue, 09 Nov 2004 10:14:55 +0100
Message-ID: <opsg6xa5qewwtuxg@user1.49.priv.jetnet>
References: <DEA5D319C867D5119DBD08000674A9F60BCCD34B@vies113a.sie.siemens.at> <16784.34304.615668.400334@thebsh.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22313-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16784.34304.615668.400334@thebsh.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Dnia Tue, 9 Nov 2004 11:55:28 +0300, Nikita Danilov <nikita@clusterfs.com> =
=20
napisa=B3:

>  > > WARNING: Too many iterations: 128 reiser4[ls(30795)]: traverse_tree
>  > > (fs/reiser4/search.c:488)[nikita-1481]:
>  > > WARNING: Too many iterations: 256 reiser4[ls(30795)]: traverse_tree
>  > > (fs/reiser4/search.c:488)[nikita-1481]:
>  > > WARNING: Too many iterations: 512 reiser4[ls(30795)]: traverse_tree
>  > > (fs/reiser4/search.c:488)[nikita-1481]:
>  > > WARNING: Too many iterations: 1024 reiser4[ls(30795)]: traverse_tree
>  > > (fs/reiser4/search.c:488)[nikita-1481]:

I had this few times too when I tried reiser4, first it was when I was =20
compiling kernel under 2.6.(6 or 7)-mm with autosnapshots from namesys =20
with reiser4 as my / partition. The number of iterations grow all the time =
=20
and the system locked itself after some time (about 10 - 20 minutes), I =20
couldn't do much to stop it, not even reboot couse my system just printed  =

that it is going to reboot and that's all, seems like it couldn't write =20
anything to disk.
Last time when I tried reiser4 (2.6.9-rc*-mm*) I had no problems with =20
compiling kernel but I it happend once or twice, this time it was random,  =

just while browsing net.

=A3ukasz Mierzwa


