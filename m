From: Oleg Drokin <green@namesys.com>
Subject: Re: Journal-601 error on Redhat 7.3 / reiserfs / ext3 / raid 5
Date: Tue, 1 Jul 2003 09:43:39 +0400
Message-ID: <20030701054339.GA7914@namesys.com>
References: <3F00B119.7080701@cc.hut.fi>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14793-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F00B119.7080701@cc.hut.fi>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jussi Vainionp?? <jjvainio@cc.hut.fi>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Jul 01, 2003 at 12:52:25AM +0300, Jussi Vainionp?? wrote:

> I don't think my disks are faulty, because the raid 5 / ext3 combination 
> has ran without trouble for a year (and is still running after a few 
> months). There were no disk-related log messages anywhere near the panic.

Even though there are no disk-related messages, still reiserfs sees a failed write
to journal which is obviously bad.

> Apr 27 20:18:06 un kernel: journal-601, buffer write failed

I do not know who to blame here. Try to heavily write to loop device itself (without using
reiserfs) to see if something will break? Or bettr yet - upgrade to newer kernel and see if that's
cures your problem?

Bye,
    Oleg
