From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: Expectable "errors" after reiserfsck ?
Date: Mon, 22 Jul 2002 10:41:45 -0400
Message-ID: <200207221041.45156.kuba@mareimbrium.org>
References: <20020722163344.A2669@phoenix.inf.upol.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11071-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020722163344.A2669@phoenix.inf.upol.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Petr Sindelar <sindelap@phoenix.inf.upol.cz>
Cc: reiserfs-list@namesys.com

> I'm using reiserfs for long time and noticed, that I didn't run reiserfsck
> for long time too. And since i got some "croslinks" in my mp3 files (the
> begging of file is from another file of disk, etc), i tried latest
> reiserfsck with --check. Logs are at
> http://phoenix.inf.upol.cz/~sindelap/rfs/, but what I want to know-> can i
> expect reiserfsck will damage both files (original and the crosslinked
> one?). Thi happened after power down, when I was renaming and tagging these
> files. What about the errors reiserfsc complains on all volumes? I haven't
> so much free disk space for backup whole hdd. Can I use --fix-fixable or
> should I use other switches (--rebuild-sb/--rebuild-tree?) On all disks
> were run rebuild-tree and rebuild-sb about year ago maybe 5 times (strange
> things with early rfs version)...

Don't do --rebuild-sb, it's not needed since the partitions seem to mount 
okay.

--fix-fixable should fix crosslinks, and it won't damage the files unless they 
are already damaged.

*Do* make sure that you run the latest reiserfstools (3.6.2 or newer), and 
that your filesystems are not mounted (not even read-only).


Cheers, Kuba Ober
