From: Vince <fuzzy77@free.fr>
Subject: Re: reiser4 corruption
Date: Sat, 04 Sep 2004 20:23:23 +0200
Message-ID: <413A081B.5020008@free.fr>
References: <2f4958ff04090411072d5c767d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21467-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f4958ff04090411072d5c767d@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?UTF-8?B?R3J6ZWdvcnogSmHFm2tpZXdpY3o=?= <gryzman@gmail.com>
Cc: reiserfs-list@namesys.com

Grzegorz Ja=C5=9Bkiewicz wrote:
> Hi folks
>=20
> I have some issues with KDE compilation on my computer.
> I decided to give it a try (and test), and switched over /home
> partition on one of my laptops to reiserfs v4. I am using debian
> testing (knoppix installation) + 2.6.9-mm1.

2.6.9-rc1-mm1 (I assume that's what you are using) had a bad data=20
corruption bug affecting files with a size multiple of 4K. All=20
filesystems are affected, btw.
Avoid this kernel if you need your data...

( See this thread for more information:
http://www.lib.uaa.alaska.edu/linux-kernel/archive/2004-Week-34/1694.html
)
