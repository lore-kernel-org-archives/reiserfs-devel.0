From: "Brian" <brian@english-bay.com>
Subject: Re: My mistake....
Date: Thu, 11 Jul 2002 06:35:47 -0700
Message-ID: <000501c228df$dd95df40$0e01a8c0@englishbay.com>
References: <000b01c228db$3a1b1f00$0e01a8c0@englishbay.com> <20020711170537.A2611@namesys.com> <004901c228dd$f01fe220$0e01a8c0@englishbay.com> <20020711172612.A2740@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10977-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hey:

> > >  Have you tried specifying explicit -t reiserfs
> > >  parameter?

> > Yes.

> > It reports the usual "mount" errors for wrong filesystem mount
> > parameters.

> Hm.

> > 'mount -t auto /dev/hdc2 /arch" always mounts as an ext3 filesysstem.

> Ok, so you run reiserfsck (with what options?) and it told you what?

First did --rebuild-sb then --rebuild-tree with -S
and --no-journal-available

Here is resiserfsck /dev/hdc2 messages:

Replaying journal..
No transactions found
Checking S+tree..ok
Comparing bitmaps..ok
Checking Semantic tree...
ok
No corruptions found
There are on the filesystem:
        Leaves 1443
        Internal nodes 11
        Directories 60
        Other files 2502
        Data block pointers 1227092 (zero of them 50825)
        Safe links 0
###########
reiserfsck finished at Thu Jul 11 06:32:23 2002
###########

I don't exactly know what all that means but it looks encouraging.

> So that you decided everything was restored.

Well - hoping perhaps.

> Have you rebooted after ratitioning scheme change?

Yup.

Appreciate the feedback - Thanks.

Brian
BSFH

