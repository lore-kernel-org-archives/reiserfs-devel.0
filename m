From: Oleg Drokin <green@namesys.com>
Subject: Re: Debugreiserfs Security Question (3.6.7-pre1)
Date: Fri, 20 Jun 2003 16:43:30 +0400
Message-ID: <20030620124330.GC24875@namesys.com>
References: <3EF27041.6060401@netscape.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14642-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EF27041.6060401@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuelkrause@netscape.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Fri, Jun 20, 2003 at 04:24:01AM +0200, Manuel Krause wrote:

> If I currently use debugreiserfs -p  /dev/xxx | gzip -c > xxx.gz and
> later for testing gunzip -c xxx.gz | unpack /dev/yyy  I get the same
> filenames on the last target partition. (with reiserfsprogs 3.6.7-pre1)
> If I don't want to spread info about
>  /home/manuel/my_car/tech_overview/lies_for_BMW_&_DC/engine.259.fake.jpg
> anywhere else than only on my HDD, shouldn't this file be converted to
>  /d98/d4/d2/d65/d1/23.file
> e.g., or something like that (random directory & filenames) within
> debugreiserfs, in general?!

This question was brought already, so I think I will add it to the FAQ now.
It is impossible to do this. Each directory entry is accompanied with
the hash value calculated of the name, if you change the name, hash value will differ.
(and entries are sorted in hash-order, so you cannot change hash value too).

> I don't know if that is a serious security issue. But it is one.

As long as you do not redistribute this info, there is no issue, I believe.

> No no, I don't doubt your developers' debugging cyle and purpose at all.
> But I don't need you (and others if we couldn't establish a secure
> connection) to read our filenames. In case of real failure we may not
> be able to rename anything any more, you know..

Well, in this case we won't be able to debug the problem, it seems.
Unless you will be able to describe what happened so good, that we will
be able reproduce it ourselves.

And you know, in case of real corruptions, not only filenames are included in dump,
parts of the file's tails could be included as well.

Bye,
    Oleg
