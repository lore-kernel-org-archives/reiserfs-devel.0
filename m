From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 11:40:28 +0200
Message-ID: <1939276887.20040826114028@tnonline.net>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
 <20040825152805.45a1ce64.akpm@osdl.org> <112698263.20040826005146@tnonline.net>
 <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org>
 <1453698131.20040826011935@tnonline.net>
 <20040825163225.4441cfdd.akpm@osdl.org>
 <20040825233739.GP10907@legion.cup.hp.com> <20040825234629.GF2612@wiggy.net>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20608-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040825234629.GF2612@wiggy.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wichert Akkerman <wichert@wiggy.net>
Cc: Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



> Previously Jeremy Allison wrote:
>> Multiple-data-stream files are something we should offer, definately (IMHO).
>> I don't care how we do it, but I know it's something we need as application
>> developers.

> Aside from samba, is there any other application that has a use for
> them?

  Yes,  for  example  documents,  image  files  etc. The multiple data
  streams  can  contain thumbnails, info about who is editing the file
  (useful for networked files) etc. Could be used for version handling
  and much more.

  Also, just because we do not see all the benefits right now, doesn't
  mean there won't be any.

  ~S

> Wichert.





