From: Oleg Drokin <green@namesys.com>
Subject: Re: Filesystem Corruption
Date: Fri, 7 Jun 2002 11:15:39 +0400
Message-ID: <20020607111539.B12869@namesys.com>
References: <200206061400.01445.kpalmer@advance.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10661-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200206061400.01445.kpalmer@advance.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kurt <kpalmer@advance.net>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jun 06, 2002 at 02:00:01PM -0400, Kurt wrote:

> error stating the file pointed to nowhere.
> I was unable to complete a reiserfsck --fix-fixable because of the length of 
> time that this (fsck) process took since this was an unscheduled downtime.
> During the weekend i will attempt to do the fsck again, however i really 
> needed to know if this problem has been observed by anyone else, and what 
> steps they took to fix the problem.

We recommend you to upgrade your kernel to 2.4.18.
To know what exact problem is it would be very useful if you'd posted excerpts
from kernel logs with actual errors.
Thank you.

Bye,
    Oleg
