From: Dirk Meul <dirk.meul@epost.de>
Subject: Re: "reiserfsck --rebuild-tree" fails
Date: 25 Sep 2002 13:29:19 +0200
Message-ID: <1032953396.27530.21.camel@riggs>
References: <Pine.LNX.4.33L2.0209251208570.1154-100000@mailbackup.pi.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11526-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.33L2.0209251208570.1154-100000@mailbackup.pi.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello.

On Mit, 2002-09-25 at 12:15, Ole Tange wrote:
> This is a hardware error. Try running:
> 
>   ide-smart /dev/hda
> 
> If ide-smart does not complain you can map out the bad sector by running
> badblocks on your disk (this will erase the content).

Thank you for your answer. Will "reiserfsck --rebuid-tree" succeed after
badblock running? I think 85%-90% of the data will be ok and this
badblocks contain a file which should be deleted.

Regards,
--
Dirk

