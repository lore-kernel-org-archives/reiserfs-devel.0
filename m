From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 11:54:53 +0200
Message-ID: <1898257286.20040826115453@tnonline.net>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
 <20040825152805.45a1ce64.akpm@osdl.org>
 <112698263.20040826005146@tnonline.net>
 <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org>
 <1453698131.20040826011935@tnonline.net>
 <20040825163225.4441cfdd.akpm@osdl.org>
 <20040825233739.GP10907@legion.cup.hp.com>  <20040825234629.GF2612@wiggy.net>
 <1093480940.2748.35.camel@entropy>  <20040826044425.GL5414@waste.org>
 <1093496948.2748.69.camel@entropy>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20614-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093496948.2748.69.camel@entropy>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicholas Miell <nmiell@gmail.com>
Cc: Matt Mackall <mpm@selenic.com>, Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com


> cp, grep, cat, and tar will continue to work just fine on files with
> multiple streams.

> tar and cp will lose the extra streams until somebody fixes them, but
> they lose ACLs and xattrs right now, and I don't hear anybody suggesting
> that ACLs and xattrs be removed from the kernel because of this.

  I  thought  that  the  underlaying  FS/VFS would make sure the extra
  streams  would  be  preserved. Normal applications that doesn't have
  support  for  them  should  not  destroy the extra streams (and meta
  data,attributes etc).

  Of course tar is different, but any probgram that uses the normal OS
  API to copy, write and read files should not affect the extra info.

  ~S

> Fixing programs that do recursive filesystem traversals is a matter of a
> glibc patch to nftw(3) and a modification to their option processing.

> Holding back a useful feature because you don't want to upgrade
> coreutils is just plain dumb.

> (BTW, for email, multipart/parallel is a start, but a specific multipart
> content type for multi-stream file attachments would probably be more
> appropriate.)




