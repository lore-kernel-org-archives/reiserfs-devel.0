From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 11:59:59 +0200
Message-ID: <1565398922.20040826115959@tnonline.net>
References: <20040825152805.45a1ce64.akpm@osdl.org>
 <112698263.20040826005146@tnonline.net>
 <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org>
 <1453698131.20040826011935@tnonline.net>
 <20040825163225.4441cfdd.akpm@osdl.org>
 <20040825233739.GP10907@legion.cup.hp.com> <20040825234629.GF2612@wiggy.net>
 <1093480940.2748.35.camel@entropy> <20040826044425.GL5414@waste.org>
 <1093496948.2748.69.camel@entropy> <20040826053200.GU31237@waste.org>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20615-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826053200.GU31237@waste.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Mackall <mpm@selenic.com>
Cc: Nicholas Miell <nmiell@gmail.com>, Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

>> cp, grep, cat, and tar will continue to work just fine on files with
>> multiple streams.

> Find some silly person with an iBook and open a shell on OS X. Use cp
> to copy a file with a resource fork. Oh look, the Finder has no idea
> what the new file is, even though it looks exactly identical in the
> shell. Isn't that _wonderful_? Now try cat < a > b on a file with a
> fork. How is that ever going to work?

  It  should  work  on  the main file, the extra streams and meta data
  won't be copied.  Just as it is now with special attributes etc. Cat
  reads the content of a file stream, not the file container.

> I like cat < a > b. You can keep your progress.





