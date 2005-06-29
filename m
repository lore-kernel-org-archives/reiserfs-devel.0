From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: dmapi support for reiser4
Date: Wed, 29 Jun 2005 20:15:51 +0400
Message-ID: <1120061750.3725.91.camel@tribesman.namesys.com>
References: <20050628093408.GA23882@lisa.goe.net>
	 <1119958258.3495.52.camel@tribesman.namesys.com>
	 <20050629115713.GC3610@lisa.goe.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24798-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050629115713.GC3610@lisa.goe.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bjoern JACKE <bjoern@j3e.de>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2005-06-29 at 15:57, Bjoern JACKE wrote:
> On 2005-06-28 at 15:31 +0400 Vladimir Saveliev sent off:
> >> DMAPI support is a feature which is essential for usage in many 
> >> important environments. Are there any plans to add dmapi support to 
> >> reiser4 ?
> >> 
> >there is no currently
> 
> would be very nice to have that, one day reiser4 has survived all the 
> troubleful discussion about kernel integration it is in right now. 
> DMAPI is really a feature which is a must-have for big setups. One of 
> the reasons is file allocation info which is retrievable which makes 
> sparse file handling efficient. Of course there are much more useful 
> posibilities DMAPI gives to get over POSIX limitation. XFS, JFS2, 
> GPFS, Veritas filesystem for Solaris, they all have DMAPI support 
> and reiser4 will not be a real competitor without this. I hope it 
> will come one day ...
> 

I would guess that it is rather operating system feature than a
filesystem one. Can you please point some source of information about
DMAPI?

> Bjoern
> 

