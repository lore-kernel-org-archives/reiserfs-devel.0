From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: linux and nfs issues
Date: Thu, 29 Jan 2004 14:10:04 +0100
Message-ID: <20040129141004.63f06c23@philou.gramoulle.local>
References: <1075376569.633.166.camel@manson.ednet.co.uk>
	<20040129130517.61e26e31@philou.gramoulle.local>
	<1075380111.624.242.camel@manson.ednet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16651-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1075380111.624.242.camel@manson.ednet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello,

Well, i'd advise you to upgrade to latest kernel if you can.
Then if you can't i'd advise you not to put the postfix mail queue over NFS, but over
local and fast disks.

Besides the problems you described, this is quite a performance hit even for a moderate
busy server.

And to quote Postfix author:

"Couple years ago I talked with someone at WebTV. They ran Postfix
queues on top of NFS. As a result of their experience I added one
NFS workaround to Postfix. However, NFS is not a perfect emulation
of a local disk, and strange things can happen occasionally.

	Wietse
"

He said he tried to put every trick to make postfix play nice with NFS.

Depending of your application, you may not switch the postfix queues to local
disks, in which case i don't really know what's the best for you.

Thanks,

Philippe

On Thu, 29 Jan 2004 12:41:51 +0000
Robert Lazzurs <lazzurs@lazzurs.net> wrote:

  | Sorry, I should have made that more clear.  Yes, we are having issues,
  | this is what I have seen on the clients from postfix.
  | 
  | Jan 28 11:03:35 liszt-01/liszt-01 postfix/smtp[31184]: fatal: update
  | queue file active/4/D/4DF43CE6AD: Stale NFS file handle
  | 
  | However I have to be honest and say that I cannot relate directly the
  | above error to the kernel error I posted........however I can say for
  | sure that it is an NFS issue.
  | 
  | Thanks, kind regards - RL
