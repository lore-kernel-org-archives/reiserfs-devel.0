From: Hans Reiser <reiser@namesys.com>
Subject: Re: Plugin Patch (was Re: creating live virtual files by concatenation)
Date: Tue, 28 Feb 2006 11:00:45 -0800
Message-ID: <44049DDD.5090508@namesys.com>
References: <1271316508.20060225153749@dns.toxicfilms.tv> <Pine.LNX.4.63.0602251736340.13659@cuia.boston.redhat.com> <44036470.8050305@namesys.com> <200602272224.19908.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28154-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200602272224.19908.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com

XFS is larger than Reiser4.......


Peter van Hardenberg wrote:

>Hans,
>
>you've said that these kinds of plugins should be something a weekend warrior 
>could tackle. Our group had a real stab and dumped hundreds of man hours into 
>the project with little effect. Admittedly, we were not experienced kernel 
>hackers, but we were all comfortable in low-level C and quite happy to read 
>source.
>
>I request that a simple plugin be maintained as a standalone patch to Reiser4.
>
I will accept a patch doing that.  Unfortunately, my guys really need to
focus on getting done the stuff needed for us to get into the kernel
first before we could tackle that.

> 
>
>Ideally, there would be a small set of these plugins demonstrating how to 
>create a new plugin which operates within the existing disk structure, and 
>one that extends the on-disk format in a safe way.
>
>This would allow interested parties to see in isolation what a Reiser4 plugin 
>looks like and would further provide a conceptual grappling point for the 
>development of a new plugin.
>
>I have been getting requests for just such a plugin to be added to my reiser4 
>developer's wiki (http://pvh.ca/trac/wiki/reiser4) at a rate of about one 
>every two months. A few successful third-party plugins would hopefully 
>increase interest in this.
>
>I realise you and your team are up to your necks in serious work on hardcore 
>lowlevel material, but I believe a brief diversion of some of your resources 
>would provide a significant reward. 
>
>Right now, the cost-of-entry appears to be set too high for developers outside 
>your team to approach the project.
>  
>
I share your concerns on this.

>If this information is already out there somewhere, great. I will integrate it 
>in the R4DevWiki and answer questions as best I can. If anyone out there 
>disagrees with me about the current difficulty of producing even a simple 
>plugin, let them prove me wrong with a patch.
>
>-pvh
>
>  
>

