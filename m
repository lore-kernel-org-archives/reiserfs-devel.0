From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: Oops with in nfsd - 2.4.19-pre6
Date: Thu, 14 Nov 2002 17:04:09 +0100
Message-ID: <20021114170409.5f9b9108.philippe.gramoulle@mmania.com>
References: <20021031210828.45F4A216991@server5.fastmail.fm>
	<1036099804.14984.165.camel@tiny>
	<20021112182949.45436c95.philippe.gramoulle@mmania.com>
	<1037211258.288.97.camel@tiny>
	<20021113194008.6dadeed5.philippe.gramoulle@mmania.com>
	<1037219001.21957.151.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11992-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1037219001.21957.151.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

On 13 Nov 2002 15:23:21 -0500
Chris Mason <mason@suse.com> wrote:

  |  > 
  |  > BTW, should i apply the patch posted on LKML ?
  |  > Subject:2.[45] fixes for design locking bug in wait_on_page/wait_on_buffer/get_request_wait
  |  
  |  No, wait for that fix to get into a kernel before using it.  There might
  |  still be small modifications, and andrea might find a few other places
  |  in the kernel with similar races.
  |  
  |  The bug results in io stalls, and the machines that do see them stall
  |  for between 10 minutes and an hour.  If you needed the patch you would
  |  have already been complaining ;-) 

Well, now that you mention this, i may also have it on my bug squash list :o)
When we feed some files to a MySQL server ( 4 way box, lots of threads), sometimes the
box does nothing , pretty much like andrea described it , so it may be that.

  |  The races do not cause corruptions or crashes of any kind.

Right no corruption, just mysql sitting there doing nothing.
Ok then i'll wait for the next version.
  |  

  |  > 
  |  > Let me know what are you plans.
  |  
  |  Jan and I will get an updated quota patch asap,

This is just great :o) Do you have a rough idea when it will be
available ? couple days ? couple weeks ?


  |  and I'll have my
  |  attempted fix for the transaction overflow ready for you against that
  |  set of patches in a few hours.

I already got your fixed and but it on 4 or 5 production boxes that triggered the bug.

So far,it's been running fine :o) but without quotas ;o))

Thanks much

Philippe
