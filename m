From: Christophe Saout <christophe@saout.de>
Subject: Re: Quota-patches for 2.4.20 conflict with evms (?)
Date: 12 Jun 2003 15:37:23 +0200
Message-ID: <1055425043.2059.6.camel@chtephan.cs.pocnet.net>
References: <21554.1055424030@www65.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14512-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <21554.1055424030@www65.gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lars Grobe <grobe@gmx.net>
Cc: reiserfs-list@namesys.com

Hi!

> , obviously a result from changes in the Quota-patches
> 05_quota-patch-2.4.15-1-2.4.16
> that are to enable quota support for reiser.
> 
> So I wonder if anyone out there has been able to get reiserfs (3.x) with
> quotas on
> evms (2.x) - or am I really the first with this crazy idea?

No, you aren't. I'm not exactly sure what the current status for the
quota patches for reiserfs unter linux 2.4 is, but the last time I
checked, you needed to upgrade the quota implementation (some macros
were renamed, like DQUOT_SYNC).

Did you get any rejects while applying the patches (look for .rej files
with find -name \*.rej)?

What patches did you exactly try to apply?

If the only problem is in fs/buffer.c:

The DQUOT_SYNC in fsync_super has to be changed to DQUOT_SYNC_DB.
The ones in fsync_dev and fsync_dev_lockfs into DQUOT_SYNC_DEV.

I assume that the evms code adds the VFS locking patch, which introduces
the function fsync_dev_lockfs, so I suppose you just need to change the
DQUOT_SYNC to DQUOT_SYNC_DEV in this file.

-- 
Christophe Saout <christophe@saout.de>

