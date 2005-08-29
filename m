From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: fs_mark benchmark - update
Date: Mon, 29 Aug 2005 10:44:38 -0400
Message-ID: <1125326679.5544.61.camel@localhost.localdomain>
References: <3257ddd0050825050117ead2ba@mail.gmail.com>
	 <430DC64D.9010205@namesys.com> <4313006C.9040502@emc.com>
	 <Pine.LNX.4.63.0508291436100.29195@alpha.polcom.net>
	 <1125319246.5544.19.camel@localhost.localdomain>  <43130DC1.20105@emc.com>
	 <1125322484.5544.23.camel@localhost.localdomain> <431311A1.8030906@emc.com>
	 <1125323863.5544.34.camel@localhost.localdomain> <43131684.5040708@emc.com>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25696-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43131684.5040708@emc.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ric Wheeler <ric@emc.com>
Cc: Grzegorz Kulewski <kangur@polcom.net>, "Vladimir V. Saveliev" <vs@namesys.com>, Sandeep Tyagi <sandeepktyagi@gmail.com>, okuyamak@dd.iij4u.or.jp, reiserfs <reiserfs-list@namesys.com>

On Mon, 2005-08-29 at 10:07 -0400, Ric Wheeler wrote:
> 
> Ming Zhang wrote:
> 
> >On Mon, 2005-08-29 at 09:46 -0400, Ric Wheeler wrote:
> >  
> >>It is also interesting to compare reiserfs vs ext3 when writing single 
> >>threaded across the life span of a file system - reiserfs typically 
> >>beats ext3 for most cases, but ext3 eventually catches up as the 
> >>percentage used grows.
> >>
> >>    
> >>
> >
> >this is interesting. looks like a file system aging problem. does this
> >because of the fragmentation?
> >  
> >
> 
> I think that this is because of the depth and size of the tree.  We have 
> very large volumes (up to 300GB) - if your file systems are smaller, 
> then the degradation is not as large.
> 

so will this be a scalability problem? all because we have 4KB block
size instead of using 64KB block size and pack small data using that
"tail" option?

500GB SATA is easy to buy and TB storage is not a dream at all. so this
will be a problem.


> >
> >what u mean new ext3?
> >  
> >
> I should have said "new patches to ext3".  At OLS, there was a talk 
> describing this work - you can get the proceedings from linuxsymposium.org:
> 
> http://www.linuxsymposium.org/2005/view_abstract.php?content_key=90
> 
> 

ic. thanks!

ming


