From: Chris Mason <mason@suse.com>
Subject: Re: 2.6.2 + datalogging: oops when filling partition
Date: Tue, 17 Feb 2004 08:23:13 -0500
Message-ID: <1077024193.7774.15.camel@watt.suse.com>
References: <20040217090438.4db8b96f.petchema@concept-micro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16818-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040217090438.4db8b96f.petchema@concept-micro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Etchemaite <petchema@concept-micro.com>
Cc: reiserfs-list@namesys.com

On Tue, 2004-02-17 at 03:04, Pierre Etchemaite wrote:
> Kernel: 2.6.2 + 2.6.1 datalogging patches (all but
> 04-reiserfs-balance_dirty)
> 
> Audacity suddenly filled /tmp, mount-binded to /var/tmp, which resulted in
> 
> Message from syslogd@rayanne at Tue Feb 17 02:50:59 2004 ...
> rayanne kernel: journal-1577: handle trans id 3251852 != current trans id
> 3251853
> 
Hmmm, it happened when the disk filled?  Thanks I'll take a look.

-chris


