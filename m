From: "Jonathan Bastien-Filiatrault" <joe@x2a.org>
Subject: Re: Space lost?
Date: Sat, 7 Jan 2006 00:16:14 -0500 (EST)
Message-ID: <3405.66.131.16.74.1136610974.squirrel@x2a.org>
References: <43BF4857.8070901@eriberto.pro.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-27610-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43BF4857.8070901@eriberto.pro.br>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eriberto <eriberto@eriberto.pro.br>
Cc: reiserfs-list@namesys.com

Eriberto said:
> Hello!
>
> I have a partition with 19.535.040 KB (fdisk -l). However after a
> ReiserFS formatting df -k command shows 19.534.436 KB (total space). The
> difference is 604 KB. Why the amount of  space decreased after formatting?
>
> Thanks!
>
>
>
Any filesystem has sturctural overhead. For example, by default, ReiserFS
has a 32MB journal and other data structures. These data structures are
the ones that "take away" space from you. These data structures are
mandatory to any filesystem, ReiserFS is known for having very little
overhead compared to other file systems.

Jonathan

