From: Oleg Drokin <green@namesys.com>
Subject: Re: bug report
Date: Tue, 29 Apr 2003 12:43:23 +0400
Message-ID: <20030429084323.GL1231@namesys.com>
References: <Pine.LNX.4.53.0304281636140.366@max15g> <20030429054902.GA16939@namesys.com> <Pine.LNX.4.53.0304290246160.662@max15g>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13895-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.53.0304290246160.662@max15g>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robs@op.net
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Apr 29, 2003 at 04:20:44AM -0400, robs@op.net wrote:

> > Do you know how you get it damaged?
> Brilliant MS "format"- it formatted the WRONG partition.  I don't know how,
> partition was different and marked "Linux 83", but leave it to MS.  I looked
> at the sectors- it overwrote the MBR and everything.  I fixed the partition
> table because I had the info.  "MS Format" didn't do a ton of damage,
> though, and I'm hoping to get back some data, but it's not critical. :)
> (In the future I will NOT run MS stuff with Linux partitions in the same
> system.  I certainly will NOT run any MS "tools" with Linux partitions in
> system.  Never had a problem before, but that's good old MS for you.)

Unfortunatelly such a case falls under "user error" in our book. We do not
provide free support in those cases.

> Anyway, tried "reiserfstune --make-journal-standard /dev/hdb1" and that
> dumps a bunch of stuff:
> ATTENTION! Filesystem with non-standard journal found. Continue? (y/n):y
> reiserfstune: Can not create standard journal on separated device [0x343]

Well, that's where --no-journal-available option would make sence.

> Tried "-f" options with some of above and got nowhere.  I can't find where
> to get the patches you refer to in documentation- for relocatable journal,
> etc.

You don't have relocated journal anyway.

Bye,
    Oleg
