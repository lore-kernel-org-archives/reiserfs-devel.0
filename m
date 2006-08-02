From: =?utf-8?B?xYF1a2FzeiBNaWVyendh?= <prymitive@pcserwis.net>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Wed, 02 Aug 2006 19:07:39 +0200
Message-ID: <op.tdn1u1c27okmjo@localhost>
References: <200608021845.k72Ij7us009749@laptop13.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932131AbWHBTIE@vger.kernel.org>
In-Reply-To: <200608021845.k72Ij7us009749@laptop13.inf.utfsm.cl>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, LKML <linux-kernel@vger.kernel.org>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Wed, 02 Aug 2006 20:45:07 +0200, Horst H. von Brand =20
<vonbrand@inf.utfsm.cl> napisa=C5=82:

> Vladimir V. Saveliev <vs@namesys.com> wrote:
>> On Tue, 2006-08-01 at 17:32 +0200, =C3=85=EF=BF=BDukasz Mierzwa wrot=
e:
>> > Dnia Fri, 28 Jul 2006 18:33:56 +0200, Linus Torvalds =20
>> <torvalds@osdl.org>
>> > napisa=C3=85=E2=80=9A:
>> > > In other words, if a filesystem wants to do something fancy, it =
=20
>> needs to
>> > > do so WITH THE VFS LAYER, not as some plugin architecture of its=
 =20
>> own. We
>> > > already have exactly the plugin interface we need, and it litera=
lly =20
>> _is_
>> > > the VFS interfaces - you can plug in your own filesystems with
>> > > "register_filesystem()", which in turn indirectly allows you to =
=20
>> plug in
>> > > your per-file and per-directory operations for things like looku=
p =20
>> etc.
>
>> > What fancy (beside cryptocompress) does reiser4 do now?
>>
>> it is supposed to provide an ability to easy modify filesystem behav=
iour
>> in various aspects without breaking compatibility.
>
> If it just modifies /behaviour/ it can't really do much. And what can=
 be
> done here is more the job of the scheduler, not of the filesystem. Ke=
ep =20
> your
> hands off it!

You modify the way the fs stores files or let You access them, since wh=
en =20
it is a job for a scheduler?

> If it somehow modifies /on disk format/, it (by *definition*) isn't
> compatible. Ditto.
>
>> > Can someone point me to a list of things that are required by kern=
el
>> > mainteiners to merge reiser4 into vanilla?
>>
>> list of features reiser4 does not have now:
>> O_DIRECT support - we are working on it now
>> various block size support
>
> Is this required?
>
>> quota support
>> xattrs and acls
>
> Without those, it is next to useless anyway.

I don't use any of this and I live quite happly.

