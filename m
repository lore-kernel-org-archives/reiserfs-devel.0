From: "darren" <teodarren@myrealbox.com>
Subject: Re: Re: reiserfs and TUX2 - 2.4.18 or 2.4.19?
Date: Fri, 20 Dec 2002 01:08:01 +0000
Message-ID: <1040346481.bb5f0760teodarren@myrealbox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12181-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: green@namesys.com
Cc: reiserfs-list@namesys.com

Hi!

Thanx for responding to my ques.

So, to make my reiserfs on my RedHat7.3 kernel the same one as the one in K=
ernel 2.4.20, all i have to do is to patch:

2.4.18-pre1.pending
2.4.18-pre2.pending
.
.
2.4.18-rc1.pending
2.4.18.pending
2.4.19
2.4.20

and so on??

-----Original Message-----
From: Oleg Drokin <green@namesys.com>
To: darren <teodarren@myrealbox.com>
Date: Thu, 19 Dec 2002 18:58:05 +0300
Subject: Re: reiserfs and TUX2 - 2.4.18 or 2.4.19?

Hello!

On Thu, Dec 19, 2002 at 11:53:49PM +0800, darren wrote:

> I want to run TUX2 to serve files off my ReiserFS partition.
> But I cannot seem to get TUX2 on kernel 2.4.19, which I would like to
> run my reiserfs partition on.

We cannot tell you anything about Tux2 because we do not know anything
about it ;)

> Should I just stick to 2.4.18 and somehow patch the reiserfs there??

If you plan to run not current 2.4 kernels, you might want to
get patches from ftp://ftp.namesys.com/pub/reiserfs-for-2.4/<version>.pendi=
ng

Where <version> next kernel version. (repeat that until you reach latest
kernel). 

But actually 2.4.18 is pretty stable and you may not want to patch it if yo=
u
want.

Bye,
    Oleg



