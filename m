From: Oleg Drokin <green@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 09:35:50 +0300
Message-ID: <20030212093550.C9690@namesys.com>
References: <3E494808.413781E@interface-ag.com> <3E495CC6.8020202@namesys.com> <20030211144144.A5A9.MIKE@mystica.cx> <3E49721D.9060205@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12696-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E49721D.9060205@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Mike Hodson <mike@mystica.cx>, reiserfs-list@namesys.com, vs@namesys.com

Hello!

On Wed, Feb 12, 2003 at 12:58:53AM +0300, Hans Reiser wrote:

> Oleg and Vladimir, what is the status of the unlink bug?  I'd prefer to 

Vladimir is investigating it. He does not know the reason of it yet.
BTW, while the bug is the bug and should of course be fixed, that particular one
is not causing any data corruption or similar stuff. It manifests itself in
directory entries pointing to nowhere (annoying once happens) under
certain workloads (I believe it starts to happen in low memory situations).

> say that we have no bugs at all....

Sure, we all would love to be able to say this.

Bye,
    Oleg
