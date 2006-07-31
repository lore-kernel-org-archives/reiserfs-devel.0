From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Mon, 31 Jul 2006 18:05:01 +0200
Message-ID: <op.tdj9mnrnd4os1z@localhost>
References: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl> <1154164364.2903.10.camel@laptopd505.fenrus.org> <44CBA4BF.80301@slaphack.com> <200607300132.28326.sarathmenon@gmail.com> <44CBC557.4050403@slaphack.com> <20060730115526.GB5336@hermes.uziel.local> <7a329d910607301410x6d6fb4f0sa946c8764be82ab1@mail.gmail.com> <20060730213757.GB6420@hermes.uziel.local> <20060730214237.GC6420@hermes.uziel.local> <7a329d910607310821p69e964f7t8d29300f3221cfa3@mail.gmail.com> <44CE286F.6000700@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29297-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44CE286F.6000700@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Mon, 31 Jul 2006 17:57:35 +0200, David Masover <ninja@slaphack.com> =20
napisa=B3:

> Wil Reichert wrote:
>> =3D)
>>  That was sorta the plan.
>>  Any idea how the fragmentation resulting from re-syncing the tree
>> affects performance over time?
>
> Try to post replies at the bottom, or below the context.
>
> Yes, it does affect it a lot.  I have no idea how much, and I've never =20
> benchmarked it, but purely subjectively, my portage has gotten slower =20
> over time.

I gues that extens are much harder to reuse then normal inodes so when You =
=20
have something as big as portage tree filled with nano files wich are =20
being modified all the time then You just can't keep performance all the =20
time. You can always tar, rm -fr /usr/portage, untar and You will probably =
=20
speed things up a lot.
