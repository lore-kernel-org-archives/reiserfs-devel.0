From: Helge Hafting <helge.hafting@hist.no>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 03 Sep 2004 10:54:26 +0200
Message-ID: <41383142.4080201@hist.no>
References: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com> <200408290004.i7T04DEO003646@localhost.localdomain> <20040901224513.GM31934@mail.shareable.org> <20040903082256.GA17629@kroah.com> <2f4958ff04090301326e7302c1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21416-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f4958ff04090301326e7302c1@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?UTF-8?B?R3J6ZWdvcnogSmHFm2tpZXdpY3o=?= <gryzman@gmail.com>
Cc: Greg KH <greg@kroah.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Grzegorz Ja=C5=9Bkiewicz wrote:

>
>devfs was very natural, and simple solution. But to have it right, it
>would have to be the only /dev filesystem.
>But no, we like choices, so we have chaos.=20
>Udev is just another thing adding to that chaos.
>
>Someone was numbering things that are good in BSD design, in that
>thread. One of those things was going for devfs. No cheap solutions.
>One fs for /dev. And it works great.
>
>Sorry for bit of trolling.
> =20
>
Devfs was a ver good idea.  The implementation of it
was a problem, and after some time nobody maintained it.
No surprise it had to go.  Now udev+tmpfs can do the same
job, and more.

Helge Hafting
