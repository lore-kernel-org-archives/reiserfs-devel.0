From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: Promise raid controller writes to disk, anybody know where?
Date: Wed, 16 Apr 2003 23:37:30 +0200
Message-ID: <20030416213730.GB1159@hvs.envisage.co.za>
References: <3E9D83B7.4050904@namesys.com> <1050528366.13617.16.camel@fortknox>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13691-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1050528366.13617.16.camel@fortknox>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Soeren Sonnenburg <reiserfs@nn7.de>
Cc: Reiserfs-List@namesys.com

On Wed, Apr 16, 2003 at 11:26:06PM +0200, Soeren Sonnenburg wrote:
> On Wed, 2003-04-16 at 18:24, Hans Reiser wrote:
> > I just bought this motherboard with a promise raid controller builtin 
> > whose manual mentions that it writes information to disk (volume and 
> > config info I believe).  Anybody know where it does this, and whether I 
> > need to be worried about it stepping on something?

It's saving it's mirror information in the last track of each of the drives
in the "RAID" setup.

> Yes, I just threw 2 promise controllers away because the drivers are
> damn instable (at least for kernels 2.4.19- 21pre7).

Which ones?
I'm using a Asus A7V133 with the promise 20265, and so far working for me..
(Though, I've also dropped the use of the quasi promise raid in favor of md)

Hendrik

