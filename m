From: Sander <sander@humilis.net>
Subject: Re: reiser4 problems on amd64: things to try?
Date: Tue, 4 Jan 2005 16:46:43 +0100
Message-ID: <20050104154643.GA29433@favonius>
References: <20050103173732.GB13054@favonius> <1104851439.31912.57.camel@tribesman.namesys.com>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23036-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1104851439.31912.57.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: sander@humilis.net, reiserfs-list@namesys.com, "reiserfs-dev@namesys.com" <reiserfs-dev@namesys.com>

Hi,

For some reason mails to the mailinglist don't make it. Also not to the
archives, but I got no error back yet.

And www.namesys.com was unreachable this morning (GMT+1).


Vladimir Saveliev wrote (ao):
> On Mon, 2005-01-03 at 20:37, Sander wrote:
> > Tomorrow morning I'll reinstall (and reformat to reiser3) a dual
> > Opteron which has a troublesome reiser4 fs.
> > 
> > Should I run some tests, or retrieve some debug info from the
> > reiser4 fs before I reformat?
> 
> Please describe the problem you had with reiser4.

This was on kernel 2.6.10-rc3-mm1.
bonnie++ went just fine with reiser4 on top of disk, raid0, raid1, raid5
and raid10. apt-get (Debian) on reiser4 raid10 gave segfaults so I let
that run om tmpfs. I believe useradd also gave segfaults an crashed the
system. Not sure though.

I've reformatted the system already to reiser3, but I might be able to
do some tests on reiser4 on a loopback device?

-- 
Humilis IT Services and Solutions
http://www.humilis.net
