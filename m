From: Fredrik Tolf <fredrik@dolda2000.com>
Subject: Re: XATTR bugs
Date: Wed, 26 Nov 2003 03:13:08 +0100
Message-ID: <16324.3124.24337.108932@pc7.dolda2000.com>
References: <16323.62343.428966.858580@pc7.dolda2000.com>
	<3FC361A9.30709@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16167-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FC361A9.30709@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Fredrik Tolf <fredrik@dolda2000.com>, reiserfs-list@namesys.com, jeffm@suse.de

Hans Reiser writes:
 > Fredrik Tolf wrote:
 > 
 > >Hi!
 > >
 > >I just applied the ReiserFS xattr patches to my 2.6.0-test10 Linux
 > >kernel, and I found what appears to be two bugs.
 > >
 > >The patches were those from
 > >ftp://ftp.suse.com/pub/people/jeffm/reiserfs/aclea/
 > >
 > >Since there is no mention of this URL on the namesys.com home page, I
 > >don't know if these patches are "official".
 > >
 > Nope.  They are suse kernel only.  The official kernel has V4 as the 
 > planned point of entry for ACLs, and V3 is in something very close to a 
 > frozen state. 
 > 
 > > If they aren't, please
 > >tell me so and I will turn elsewhere, and if you know where to mail it
 > >instead, please tell me that too.
 > >  
 > >
 > jeffm@suse.de can help you.  Please DO consider them on-topic for 
 > reiserfs-list though.  Just because I am not accepting them into the 
 > official kernel does not mean I want to stand in the way of people doing 
 > what they want to do with our code, and doing it effectively, it just 
 > means I have a different philosophy of release management.;-)

OK, I see - I will forward my thoughts to him, then. Thanks!

Fredrik Tolf

