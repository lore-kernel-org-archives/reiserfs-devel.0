From: Ivan Ivanov <ivandi@vamo.orbitel.bg>
Subject: Re: Simple preformance test
Date: Thu, 11 Apr 2002 20:18:38 +0300
Sender: ivandi@idi.vamo.orbitel.bg
Message-ID: <3CB5C56E.A87B76C2@vamo.orbitel.bg>
References: <Pine.LNX.4.44.0204111506300.2077-100000@magic.vamo.orbitel.bg> <20020411165627.A992@namesys.com> <3CB598A3.483349D2@vamo.orbitel.bg> <20020411181205.A1971@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10039-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Oleg Drokin wrote:

> Hello!
>
> On Thu, Apr 11, 2002 at 05:07:31PM +0300, Ivan Ivanov wrote:
>
> > Filesystem           1k-blocks      Used Available Use% Mounted on
> > /dev/hda7              1172672   1170676      1996 100% /mnt/test
> > I know this but  df  shows 1996 blocks free
>
> These blocks cannot be used.
> They are reserved for some purpose, and there is even a code to grab
> these blocks, but the code is disabled, so each reiserfs FS have 2 Mb of data
> that cannot be allocated.
>
> Bye,
>     Oleg

When the reiserfs partition is filled up to 100% there is a bunch of messages in
logs.
I have no such messages. That was my criteria for choosing partition size - to
be allmost 100% full.

May be the performance difference is my mistake - this was just a simple test.

------
Ivan


