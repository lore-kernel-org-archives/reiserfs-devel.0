From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: SUSE 9.1 with ReiserFS:  / won't fsck, but is otherwise fine
Date: Fri, 24 Sep 2004 16:32:10 +0200
Message-ID: <20040924143210.GG1617@hvs.envisage.co.za>
References: <1095996040.10293.18.camel@xserver.local.net> <200409241116.09066.vitaly@namesys.com> <1096032016.17001.4.camel@xserver.local.net> <20040924133052.GA1617@hvs.envisage.co.za> <1096034190.17001.14.camel@xserver.local.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21905-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1096034190.17001.14.camel@xserver.local.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Worley <cworley@symbionsys.com>
Cc: reiserfs-list@namesys.com

On Fri, Sep 24, 2004 at 07:56:31AM -0600, Chris Worley wrote:
> On Fri, 2004-09-24 at 07:30, Hendrik Visage wrote:
> > 1) Why do you *want* to fsck a reiserfs? Unless you have troubles, then a
> > fsck on a reiserfs is not needed by design of a logging/journaling fs
> 
> You don't have a choice on the root file system... fsck will be run.

Then ignore it for a reiserfs...

> If there's really nothing wrong with the FS, then I'm okay just making a
> no-op fsck.reiserfs and leaving it at that... I'm just worried that
> something is really wrong with the file system, and I need to fix that. 
> As it sits atop an LVM, I want to add a few more partitions to the LVM
> and extend the Reiser fs... but I'm paranoid, with this error, to
> proceed.

First understand a logging/journaling fs :)
