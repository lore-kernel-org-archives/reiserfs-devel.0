From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Sun, 30 Jul 2006 12:30:10 +0200
Message-ID: <op.tdhzgkjqd4os1z@localhost>
References: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl> <44CA31D2.70203@slaphack.com> <Pine.LNX.4.64.0607280859380.4168@g5.osdl.org> <44C9FB93.9040201@namesys.com> <44CA6905.4050002@slaphack.com> <44CA126C.7050403@namesys.com> <44CA8771.1040708@slaphack.com> <44CABB87.3050509@namesys.com> <1154164364.2903.10.camel@laptopd505.fenrus.org> <44CBA4BF.80301@slaphack.com> <1986618636.20060730024539@wp.pl> <44CC06A7.1030104@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29266-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44CC06A7.1030104@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>, LKML <linux-kernel@vger.kernel.org>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Sun, 30 Jul 2006 03:08:55 +0200, Hans Reiser <reiser@namesys.com> =20
napisa=B3:

> Maciej So=B3tysiak wrote:
>
>>
>> Hmm, what about linspire / freespire ? Linsire is a proud reiser4 =20
>> debugging
>> sponsor as the website (http://www.namesys.com) says.
>>
>> Wouldn't they want to include reiser4 in their distro first?
>>
>>
>>
> Not if the mainstream kernel is not going to add it.....

If I got it all rigth then the VFS issue is there from the moment when =20
Hans made a request to merge reiser4 into mainstream, nobody nows what =20
will happen tomorrow, it will go in without moving things to vfs, it can =20
go in with moving some code to vfs or it can stay forever outside. If it's =
=20
not sure then no distro will use it as a main fs (or at all) becouse if =20
tommarow Hans will say "Ok, will move things to VFS" then for the next =20
year or so reiser4 will be simply dead, it will take a lot of time to =20
recode it and this change will provide a lot of bugs that will need to be  =

debuged, it won't a be a single patch anymore as You will need to patch =20
that adds reiser4 and a patch that alters VFS. What distro would toy with  =

VFS? None until it's all done, fully and trully tested and merged into =20
mainline, it won't happen quickly and it is not said that there won't be =20
any more complains when this is done.
In my opinion there is no best option for reiser4 only less evil ways, =20
it's just too different from other fs, too independent.
Again I'm no expert, just enduser.

