From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: problems with patching.
Date: Thu, 18 Jul 2002 10:06:59 -0400
Message-ID: <200207181006.59413.kuba@mareimbrium.org>
References: <1027000362.734.14.camel@prototype>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11050-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1027000362.734.14.camel@prototype>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Moritz Angermann <moritz.angermann@gmx.net>
Cc: reiserfs-list@namesys.com

On czwartek 18 lipiec 2002 09:52 am, Moritz Angermann wrote:
> o.k. i tryed to patch my 2.4.18 kernel with the patches from
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.18.pending
> as sugested...
> but a few of them fail to work.
>
> for a few i had to link /usr/src/linux to /usr/src/linux-2.4.18 and to
> /usr/src/linux-2.4.18.o
> a few were trying to patch 2.4.9-pre* .. or s.th.
> one was trying to patch 'a' and one was trying to patch a SuSE kernel.
>
> erm guys. this is no way user friendly ...
> and really confusing.

# man patch
Things are confusing when one doesn't read documentation ;-)

What you wanted to do was 
# cd /usr/src/kernel-yourversion
# patch -p1 something.patch
p1 tells patch to ignore leading directory element, so if patches were against
linux-blah/something
they would now be against
something

Cheers, Kuba Ober
