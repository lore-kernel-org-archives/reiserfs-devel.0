From: Oleg Drokin <green@namesys.com>
Subject: Re: Strange NFS/reiserfs errors
Date: Fri, 15 Aug 2003 16:13:02 +0400
Message-ID: <20030815121302.GA20698@namesys.com>
References: <3F3C7341.4020503@emageon.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15316-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F3C7341.4020503@emageon.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Tinsley <btinsley@emageon.com>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Aug 15, 2003 at 12:44:33AM -0500, Brian Tinsley wrote:

> Hi! I've posted this to the NFS mailing list, but wanted to drop it here 
> as well to see if anyone may provide further insight.
> ---------------------------
> Can anyone elaborate on what may have caused the following error:
> Aug 14 22:09:09 clarc02 kernel: nfsd-fh: found a name that I didn't 

We believe the reason is iget4() race.
We have a workaround implemented in 2.4.21, so consider upgrading.
After you upgrade, please run reiserfsck (take latest reiserfsprogs
first. Current reiserfsprogs version is 3.6.11) on all reiserfs volumes you
have.

Bye,
    Oleg
