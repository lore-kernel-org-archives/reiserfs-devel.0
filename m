From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 16:59:37 -0700
Message-ID: <412E7969.8080109@namesys.com>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825152805.45a1ce64.akpm@osdl.org> <112698263.20040826005146@tnonline.net> <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org> <1453698131.20040826011935@tnonline.net> <20040825163225.4441cfdd.akpm@osdl.org> <20040825233739.GP10907@legion.cup.hp.com> <20040825234629.GF2612@wiggy.net> <1939276887.20040826114028@tnonline.net> <20040826024956.08b66b46.akpm@osdl.org> <839984491.20040826122025@tnonline.net> <20040826032457.21377e94.akpm@osdl.org> <742303812.20040826125114@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20857-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <742303812.20040826125114@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Spam <spam@tnonline.net>
Cc: Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

What is important is that it all be one packaged solution from the same 
maintainer.  That is necessary for coherency of solution.

There is also benefit to it being one coherent body of code, but this is 
harder to articulate.  It is always hard to articulate why functionality 
belongs in the same program rather than split into multiple programs.  
Filesystems should provide primitives for ordering, structuring, and 
naming objects.  It is hard to say why we should do all of that, but on 
some level I just know it is our task.

Hans

Spam wrote:

>
>
>  You  said  it  would be socially hard. I think it would be very much
>  close to impossible to get it right. Imagine that Gnome and Nautilus
>  would  implement  support  for  these. I doubt that cp, mv, KDE, mc,
>  app-xyz  would  implement  this anytime soon and in the meantime the
>  data is at risk.
>
>
>  
>
>  
>

