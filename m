From: Chris Mason <mason@suse.com>
Subject: Re: large files
Date: Mon, 17 May 2004 16:12:22 -0400
Message-ID: <1084824741.20437.368.camel@watt.suse.com>
References: <200405172148.33162.bernd-schubert@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18740-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405172148.33162.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernd Schubert <bernd-schubert@web.de>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

On Mon, 2004-05-17 at 15:48, Bernd Schubert wrote:
> Hello,
> 
> I'm currently testing our new server and though it will primarily not serve 
> really large files (about 40-60 users will have a quota of 25GB each on a 2TB 
> array), I'm still testing the performance for large files.
> 
> So I created an about 300GB fil and the problem is to remove it now. 
> Removing it took much more than 15 minutes. Here's the the relevant top line:
> 
>  5012 root      18   0   368  368   312 D    21.9  0.0   5:48 rm
> 
> Since I didn't expect it to take so much time, I didn't measure the time to 
> delete this file.
> 
> system specifications:
> 	- dual opteron 242 (1600 MHz)
> 	- linux-2.4.26 with all patches from Chris, no further patches
> 	- reiserfs-3.6 format
> 
> The partition with the 300GB file has a size of 1.7TB.

This is most likely a combination of metadata fragmentation and the fact
that during deletes, 2.4.x reiserfs ends up reading one block at a time.

As a comparison data point, could you please try 2.6.6-mm3?  I realize
you don't want to run this kernel in production, but it would tell us if
I understand the problems at hand.

-chris


