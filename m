From: Sander <sander@humilis.net>
Subject: reiser4 on amd64 (was: Re: reiser4 for 2.6.10 and reiser4 update for 2.6.10-rc3-mm1)
Date: Sun, 2 Jan 2005 09:47:18 +0100
Message-ID: <20050102084718.GB14096@favonius>
References: <41B4A035.2020509@namesys.com> <1104430148.7086.11.camel@tribesman.namesys.com> <20041230183259.GE5206@favonius> <1104430801.7087.16.camel@tribesman.namesys.com>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23026-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1104430801.7087.16.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: sander@humilis.net, reiserfs-list@namesys.com, flx@msu.ru

Vladimir Saveliev wrote (ao):
> On Thu, 2004-12-30 at 21:32, Sander wrote:
> > Does this update make reiser4 ready for Opteron systems?
> > 
> This update does not contain anything specific for Opteron.
> Do you have any problmes with reiser4 on it?

I'm afraid so, yes. bonnie++ is oke, but an idle machine went belly up
last week (another one did the same).

Tomorrow (Monday) I'll reinstall it on reiser3. Do you want me to run
some commands to extract data from the filesystem before? (I don't have
such a system myself so I can't do a lot of tests after tomorrow).

> We are about to get such system for tests, but probably after New
> Year.

Nice. Amd64 systems are populair and it would be great to have reiser4
stable on these.
