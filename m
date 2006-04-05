From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: rebuild-tree aborted
Date: Wed, 05 Apr 2006 16:45:06 +0400
Message-ID: <1144241106.8444.99.camel@tribesman.namesys.com>
References: <4425AEC3.5010100@rpi.edu>
	 <1143378141.23834.46.camel@tribesman.namesys.com>
	 <44337667.5060500@rpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28445-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44337667.5060500@rpi.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Scott Dugas <dugass@rpi.edu>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2006-04-05 at 03:48 -0400, Scott Dugas wrote:
> I tried that, but attaching it to another computer failed at the same 
> spot, and the only extra drive I have is approximately one GB smaller, 
> so when I copy, ddrescue can't copy everything, and when I do run 

Find a spare partition of 1 gb size and setup linear raid device.
http://www.tldp.org/HOWTO/Software-RAID-HOWTO-5.html#ss5.4

> rebuild-tree it claims the superblock refers to a larger drive than the 
> partition and to --rebuild-sb, so then I ran rebuild-sb, which froze, 
> and stopped accessing the drive. Is there any way to check it regardless 
> of this size issue.
> 
> If not, is there any way to reformat and check the drive to make sure it 
> doesn't have any problems. Everything on the drive is replaceable, but 
> that would involve ripping 60+ CDs and downloading 40+ concerts, so if I 
> could keep the data, that would be nice.
> 
> --Scott
> 
> Vladimir V. Saveliev wrote:
> 
> >Hello
> >
> >On Sat, 2006-03-25 at 15:57 -0500, Scott Dugas wrote:
> >  
> >
> >>I have tried reiserfsck --rebuild-tree 11 times. Each time the pass 0 
> >>finishes successfully, but has been improving (more or less) each time. 
> >>Pass 1 fails. it fails on one of three different blocks each time 
> >>(2785605, 9671269, or 48169048), but with different amounts left to 
> >>scan. It returns the error:
> >>
> >>The problem has occurred looks like a hardware problem (perhaps
> >>memory). Send us the bug report only if the second run dies at
> >>the same place with the same block number.
> >>
> >>build_the_tree: Nothing but leaves are expected. Block 9671269 - unknown
> >>
> >>
> >>I'm using reiserfsck 3.6.19 with gentoo kernel sources 2.6.14-r5. This 
> >>is on an external drive (/dev/sda1).
> >>
> >>is there any way to fix this?
> >>
> >>    
> >>
> >I would propose you to try
> >1. to attach the drive to anotrher box and do --rebuild-tree
> >2. to copy (dd_rescue) /dev/sda1 to another hard drive and do
> >--rebuild-tree on the copy
> >
> >  
> >
> >>--Scott
> >>
> >>    
> >>
> >
> >
> >  
> >
> 
> 

