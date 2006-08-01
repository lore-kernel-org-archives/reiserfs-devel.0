From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Tue, 01 Aug 2006 17:32:52 +0200
Message-ID: <op.tdl2s2fpd4os1z@localhost>
References: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl> <44CA31D2.70203@slaphack.com> <Pine.LNX.4.64.0607280859380.4168@g5.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29399-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.64.0607280859380.4168@g5.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: Linus Torvalds <torvalds@osdl.org>, LKML <linux-kernel@vger.kernel.org>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Fri, 28 Jul 2006 18:33:56 +0200, Linus Torvalds <torvalds@osdl.org> =20
napisa=B3:

> In other words, if a filesystem wants to do something fancy, it needs to
> do so WITH THE VFS LAYER, not as some plugin architecture of its own. We
> already have exactly the plugin interface we need, and it literally _is_
> the VFS interfaces - you can plug in your own filesystems with
> "register_filesystem()", which in turn indirectly allows you to plug in
> your per-file and per-directory operations for things like lookup etc.

What fancy (beside cryptocompress) does reiser4 do now?
Can someone point me to a list of things that are required by kernel =20
mainteiners to merge reiser4 into vanilla?
I feel like I'm getting lost with current reiser4 status and things that =20
are need to be done.

=A3ukasz Mierzwa
