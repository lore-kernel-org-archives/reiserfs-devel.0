From: Chris Mason <mason@suse.com>
Subject: Re:  Red Hat Enterprise Linux AS (v. 2.1) and  > 2 GB files
Date: 27 Jun 2003 08:48:47 -0400
Message-ID: <1056718127.20899.202.camel@tiny.suse.com>
References: <1056635615.1967.377.camel@atlas.vinterbro.com>
	 <20030626155842.2c7fd748.pegasus@nerv.eu.org>
	 <3EFB1F97.3020205@namesys.com> <20030627065918.GA20771@namesys.com>
	 <20030627125003.A32245@t-raenon.nmd.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14731-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030627125003.A32245@t-raenon.nmd.msu.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: flx@msu.ru
Cc: Oleg Drokin <green@namesys.com>, Hans Reiser <reiser@namesys.com>, Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

On Fri, 2003-06-27 at 04:50, Alexander Lyamin wrote:
> Fri, Jun 27, 2003 at 10:59:18AM +0400, Oleg Drokin wrote:
> > Hello!
> > 
> > On Thu, Jun 26, 2003 at 08:30:15PM +0400, Hans Reiser wrote:
> > 
> > > >Because RedHat never bothered to update reiserfs code in their e kernels.
> > > >Your best bet is to get a newer kernel, perhaps 2.4.21, and if you cannot
> > > >afford that, trim your app to not create files that big.
> > > >There are rumors that 2.4.18 based e kernel is in the testing ... 
> > > You mean RedHat is STILL shipping 2.4.9 based kernels?  Oh no wonder 
> > > there are people with stability problems.....
> > 
> > No, I believe there was kernel update last month that upgraded RHAS kernel up to
> > 2.4.18.
> > Anyway RHAS 2.4.9 kernel does not have that much in common with vanilla 2.4.9.
> 
> If there's nothing much in common with vanilla linux, then they should not 
> mislead their customers with "linux" label on it, but should fork and do 
> something like Reddix or Hattix 2.4.9 .
> 
> Sometimes I really getting lost in marketting tricks of thouse guys.

Most of the differences are backports of features in other linux
kernels.  When you commit to maintaining a kernel for a long period of
time, you've got two choices about how to deal with critical updates. 
You can back port them from future kernels or you can offer an upgrade
path to new kernels.

Both have their own advantages.

-chris


