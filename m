From: boricua <boricua@despiertapr.com>
Subject: Re: mount fails
Date: Fri, 3 Mar 2006 08:13:18 -0500
Message-ID: <20060303081318.b238af01.boricua@despiertapr.com>
References: <20060302204756.d3a27396.boricua@despiertapr.com>
	<1141388585.6429.19.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28198-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1141388585.6429.19.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Fri, 03 Mar 2006 15:23:05 +0300
"Vladimir V. Saveliev" <vs@namesys.com> wrote:

> Hello
> 
> On Thu, 2006-03-02 at 20:47 -0500, boricua wrote:
> > using suse 10.0 , strange this is like 2nd time suse fails or my hd fails using suse
> > 
> > 
> > trying to mount /dev/hda4 fails with bad blocks and both
> > 
> > reiserfsck --rebuild-tree also fails.
> > this happend to be my / partition 
> > 
> > any other way or what else ican do to be able to mount partition
> > 
> 
> Please take a look at
> http://namesys.com/bad-block-handling.html
> 
> 



i tried fix-fixable but it tells me the block belong to the system area 
i read this does it mean if its in the system area i am out of luck ?

"I have bad blocks in the system reiserfs area, what do I do?
    ReiserFS can handle only those bad blocks that belong to the data area, and cannot handle bad blocks of the reiserfs system area -- super block, journal, bitmap."

