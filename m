From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: rebuild-tree working for more then 3 days- what to do?
Date: Fri, 07 Jan 2005 16:03:21 +0300
Message-ID: <1105103001.3810.89.camel@tribesman.namesys.com>
References: <2AEAD962-6089-11D9-A3E5-003065C0167C@xslf.com>
	 <1105093253.3616.34.camel@tribesman.namesys.com>
	 <53BAB6CE-60A5-11D9-8B41-003065C0167C@xslf.com>
	 <1105101220.4192.68.camel@tribesman.namesys.com>
	 <D00648DA-60A9-11D9-8B41-003065C0167C@xslf.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23067-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <D00648DA-60A9-11D9-8B41-003065C0167C@xslf.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shoshannah Forbes <xslf@xslf.com>
Cc: reiserfs-list@namesys.com

On Fri, 2005-01-07 at 15:44, Shoshannah Forbes wrote:
> On 07/01/2005, at 14:33, Vladimir Saveliev wrote:
> 
> > When you boot off liveCD - do you have a network
> 
> Yes, I have a Network
> 
> >  and place where
> > reiserfsprogs can be put and compiled besides that 60gb device with
> > broken reiserfs?
> 
> Not locally (that machine has only one HD), but I can mount a share on 
> the Mac via the network.
> I guess I'll try that.
> 

When you boot of liveCD root filesystem gets created in memory. You
should able to put reiserfsck there

> > Then boot liveCD, download reiserfsprogs and fsck.
> ---
> Shoshannah Forbes
> http://www.xslf.com
> 
> 

