From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Sun, 30 Jul 2006 12:13:47 +0200
Message-ID: <op.tdhyo9utd4os1z@localhost>
References: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl> <44CA31D2.70203@slaphack.com> <Pine.LNX.4.64.0607280859380.4168@g5.osdl.org> <44C9FB93.9040201@namesys.com> <44CA6905.4050002@slaphack.com> <44CA126C.7050403@namesys.com> <44CA8771.1040708@slaphack.com> <44CABB87.3050509@namesys.com> <17611.21640.208153.492074@gargle.gargle.HOWL> <44CBA99F.2040306@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29265-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44CBA99F.2040306@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: David Masover <ninja@slaphack.com>, LKML <linux-kernel@vger.kernel.org>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Sat, 29 Jul 2006 20:31:59 +0200, David Masover <ninja@slaphack.com> =20
napisa=B3:

> Nikita Danilov wrote:
>
>> As you see, ext2 code already has multiple file "plugins", with
>> persistent "plugin id" (stored in i_mode field of on-disk struct
>> ext2_inode).
>
> Aha!  So here's another question:  Is it fair to ask Reiser4 to make its
> plugins generic, or should we be asking ext2/3 first?
>

Doesn't iptables have plugins? Maybe we should make them generic so other  =

packet filters can use them ;)
