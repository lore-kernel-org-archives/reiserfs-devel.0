From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: Oops with in nfsd - 2.4.19-pre6
Date: Thu, 14 Nov 2002 18:41:53 +0100
Message-ID: <20021114184153.3298a89b.philippe.gramoulle@mmania.com>
References: <20021031210828.45F4A216991@server5.fastmail.fm>
	<1036099804.14984.165.camel@tiny>
	<20021112182949.45436c95.philippe.gramoulle@mmania.com>
	<1037211258.288.97.camel@tiny>
	<20021113194008.6dadeed5.philippe.gramoulle@mmania.com>
	<1037219001.21957.151.camel@tiny>
	<20021114170409.5f9b9108.philippe.gramoulle@mmania.com>
	<1037291572.287.277.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11995-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1037291572.287.277.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com, jack@ucw.cz

On 14 Nov 2002 11:32:51 -0500
Chris Mason <mason@suse.com> wrote:

  |  > Well, now that you mention this, i may also have it on my bug squash list :o)
  |  > When we feed some files to a MySQL server ( 4 way box, lots of threads), sometimes the
  |  > box does nothing , pretty much like andrea described it , so it may be that.
  |  
  |  Ok, that does sound like the stalling bug, especially since you've got 4
  |  cpus.

That's what i thought too as it doesn't show up as much on other smaller boxes.

  |   You can make it much less likely to trigger by lowering the
  |  threshold for where bdflush jumps in,

Ok.

  |  but andrea's final patch should show up shortly.

Excellent.

  |  
  |  >   |  
  |  >   |  Jan and I will get an updated quota patch asap,
  |  > 
  |  > This is just great :o) Do you have a rough idea when it will be
  |  > available ? couple days ? couple weeks ?
  |  
  |  Now that I've looked at it, I think the only reject is that parisc-32
  |  already has one hunk applied, and x86-64 needs to have quotav2 support
  |  added.  Neither one affects i386, but I'll do some tests here.  Jan, am
  |  I missing something?

There was indeed some rejects in parisc-32 but there were lot more than that.
Rejects were when applying reiserfs-quota-22.diff.
(using vanilla 2.4.20rc1 + ftp.suse.com:/pub/people/mason/patches/reiserfs/quota-2.4/2.4.19 quota
patches)

  |  > 
  |  > So far,it's been running fine :o) but without quotas ;o))
  |  
  |  Ok, it survived heavier load here overnight.

Excellent, moreover that i'm on duty call this week ;o)

  |  
  |  -chris
  |  

Thanks much for your help.

Philippe.
