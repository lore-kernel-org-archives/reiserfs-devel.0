From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: problems with patching.
Date: Thu, 18 Jul 2002 16:47:53 +0200
Message-ID: <20020718164753.394472bd.philippe.gramoulle@mmania.com>
References: <1027000362.734.14.camel@prototype>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11051-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1027000362.734.14.camel@prototype>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: reiserfs-list@namesys.com

On 18 Jul 2002 15:52:42 +0200
Moritz Angermann <moritz.angermann@gmx.net> wrote:

  |  i'll put the reiserfs tools on my secound partition. so i can have /
  |   unmounted and still have access to the reiserfsprogs.

I always compile reiserfsck statically linked because one might not
be able to access the partitions where the shared library are.

Given the frequency of reiserfck's use ( it shouldn't be too often :o)
i wonder if it wouldn't be better to compile it statically linked by default.

In the mean time , you can add a -static in the reiserfsck's Makefile directory.

Thanks,

Philippe.
