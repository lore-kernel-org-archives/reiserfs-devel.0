From: Chris Mason <mason@suse.com>
Subject: Re: Re: Fwd: Re: 2.4.19-rc1-jam2 (-rc1aa2)
Date: 11 Jul 2002 09:15:18 -0400
Message-ID: <1026393318.4952.21.camel@tiny>
References: <200207110235.22875.Dieter.Nuetzel@hamburg.de>
	<1026350802.4952.0.camel@tiny> <3D2CEC05.5090300@mb.tu-ilmenau.de> 
	<20020711112224.B2718@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10974-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020711112224.B2718@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, reiserfs-list <reiserfs-list@namesys.com>

On Thu, 2002-07-11 at 03:22, Oleg Drokin wrote:
> Hello!
> 
> On Thu, Jul 11, 2002 at 04:23:01AM +0200, Manuel Krause wrote:
> 
> > Are your patches going to follow 2.4.19/2.4.20-preX+namesys - once 
> > 2.4.19/2.4.20-pre is finally out
> 
> We hope to get these in time for 2.4.20.

The data logging code will follow the pure kernel, and will include
whatever other bits I need (as separate patches) to make things work. 
Once the big chunk of namesys stuff gets merged, I'll rework my patches
on top of them.

-chris


