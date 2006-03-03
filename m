From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: mount fails
Date: Fri, 03 Mar 2006 16:10:13 +0300
Message-ID: <1141391413.6429.27.camel@tribesman.namesys.com>
References: <20060302204756.d3a27396.boricua@despiertapr.com>
	 <1141388585.6429.19.camel@tribesman.namesys.com>
	 <20060303081318.b238af01.boricua@despiertapr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28199-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060303081318.b238af01.boricua@despiertapr.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: boricua <boricua@despiertapr.com>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2006-03-03 at 08:13 -0500, boricua wrote:
> On Fri, 03 Mar 2006 15:23:05 +0300
> "Vladimir V. Saveliev" <vs@namesys.com> wrote:
> 
> > Hello
> > 
> > On Thu, 2006-03-02 at 20:47 -0500, boricua wrote:
> > > using suse 10.0 , strange this is like 2nd time suse fails or my hd fails using suse
> > > 
> > > 
> > > trying to mount /dev/hda4 fails with bad blocks and both
> > > 
> > > reiserfsck --rebuild-tree also fails.
> > > this happend to be my / partition 
> > > 
> > > any other way or what else ican do to be able to mount partition
> > > 
> > 
> > Please take a look at
> > http://namesys.com/bad-block-handling.html
> > 
> > 
> 
> 
> 
> i tried fix-fixable but it tells me the block belong to the system area 
> i read this does it mean if its in the system area i am out of luck ?
> 

you have to get spare reliable partition of not smaller size and copy
hda4 to it.

Please make sure that you have to use dd_rescue to copy data.
(dd requires additional options to properly copy data off when source
file has unreadable blocks).
then run reiserfsck on new partition.

> "I have bad blocks in the system reiserfs area, what do I do?
>     ReiserFS can handle only those bad blocks that belong to the data area, and cannot handle bad blocks of the reiserfs system area -- super block, journal, bitmap."
> 
> 

