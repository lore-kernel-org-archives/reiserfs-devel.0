From: Sander <sander@humilis.net>
Subject: Re: reiser4 in 2.6.14 - lockups with mmapped files
Date: Tue, 1 Nov 2005 20:37:07 +0100
Message-ID: <20051101193706.GA16268@favonius>
References: <1130860221.12859.23.camel@laptop> <436796F6.10603@namesys.com> <1130866868.12859.36.camel@laptop>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26760-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1130866868.12859.36.camel@laptop>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fionn Behrens <fionn@spamfilter.de>
Cc: reiserfs-list@namesys.com

Fionn Behrens wrote (ao):
> On Di, 2005-11-01 at 19:25 +0300, Vladimir V. Saveliev wrote:
> > Can you please check what fs/reiser4/reiser4.h:REISER4_USE_EFLUSH is
> > set to? If it is 0, please try your test having it set to 1.
> 
> It is set to 0. I changed it to 1. What is the supposed result of this
> change?
> I am somewhat reluctant to try it and risk yet another two hours of
> fschecking. Maybe tomorrow night. If it doesnt work again, I'll get
> you some screenshots of the fscheck, too.

Maybe you can create a small partition with a minimal OS on which you
boot new these test kernels?

-- 
Humilis IT Services and Solutions
http://www.humilis.net
