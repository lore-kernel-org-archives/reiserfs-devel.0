From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: Snapshot against 2.6.1 released.
Date: Thu, 22 Jan 2004 10:09:49 -0800
Sender: Mike Fedyk <mfedyk@srv-lnx2600.matchmail.com>
Message-ID: <20040122180949.GS23765@srv-lnx2600.matchmail.com>
References: <16396.11375.115895.934750@laputa.namesys.com> <20040120080223.2921.qmail@web21505.mail.yahoo.com> <16396.64924.478222.923131@laputa.namesys.com> <400DAC72.1060502@free.fr> <401004DF.7080100@free.fr> <16400.1617.53047.679998@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16610-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <16400.1617.53047.679998@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Vince <fuzzy77@free.fr>, reiserfs-list@Namesys.COM

On Thu, Jan 22, 2004 at 08:20:17PM +0300, Nikita Danilov wrote:
> Yes, mount was unable to handle an error. This is hopefully fixed and
> will be included into new snapshot.

Vince,

Keep a compressed image of that filesystem so that you can restore it and
remount to see if the oops is fixed in future snapshots.

Mike
