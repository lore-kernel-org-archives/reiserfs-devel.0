From: Oleg Drokin <green@namesys.com>
Subject: Re: Apparent race condition in do_journal_begin_r() with UL kernel
Date: Fri, 19 Sep 2003 13:35:55 +0400
Message-ID: <20030919093555.GB31208@namesys.com>
References: <1063725179.12929.548.camel@biker.psw.pdb.fsc.net> <20030916153620.GA773@namesys.com> <1063963968.6484.3.camel@biker.psw.pdb.fsc.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15701-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1063963968.6484.3.camel@biker.psw.pdb.fsc.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Wilck <Martin.Wilck@Fujitsu-Siemens.com>
Cc: Reiser FS Mailing List <reiserfs-list@namesys.com>, mason@suse.com

Hello!

On Fri, Sep 19, 2003 at 11:32:48AM +0200, Martin Wilck wrote:

> > Below you can find the patch that may help you if I am right about roots of your second problem.
> > This is not proper fix but merely a quick plug. (I verified and it passes my testcase)
> > Chris promised to send proper patch yesterday, but seems he is busy right now.
> Yes, the results with this patch (and the other one you sent which has
> to be slightly modified for my UL kernel) look promising. ~40h IO
> activity now and no problems. If our machines are still doing fine after
> the weekend we'll conclude these patches solve the problem (actually,
> both problems) for us. I'll give you another feedback then.

Ok. Thank you for verifying our patches.

Bye,
    Oleg
