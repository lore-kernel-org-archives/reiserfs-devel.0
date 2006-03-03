From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: mount fails
Date: Fri, 03 Mar 2006 17:32:30 +0300
Message-ID: <1141396350.6429.33.camel@tribesman.namesys.com>
References: <20060302204756.d3a27396.boricua@despiertapr.com>
	 <1141388585.6429.19.camel@tribesman.namesys.com>
	 <20060303081318.b238af01.boricua@despiertapr.com>
	 <1141391413.6429.27.camel@tribesman.namesys.com>
	 <20060303084129.cd4a538a.boricua@despiertapr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28201-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060303084129.cd4a538a.boricua@despiertapr.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: boricua <boricua@despiertapr.com>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2006-03-03 at 08:41 -0500, boricua wrote:
> > 
> > you have to get spare reliable partition of not smaller size and copy
> > hda4 to it.
> > 
> > Please make sure that you have to use dd_rescue to copy data.
> > (dd requires additional options to properly copy data off when source
> > file has unreadable blocks).
> > then run reiserfsck on new partition.
> > 
> 
> 
> whats the syntax for dd_rescue  i.e my bb is 33554432  
> so how would i write to that bad blocks.
> 
I do not think you should write to bad block. Just get good device and
copy hda4 to it.
dd_rescue is to copy hda4 to another device. It will take care of
unreadable blocks properly.

dd_rescue /dev/hda4 /dev/spare-partition

> if not then i'll try your suggestion of copying the partition not sure if i can get same size since its my root partition 
> but i would like to do it for learning reasons 
> 
bigger size is also fine.



