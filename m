From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 02:36:50 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <4131A3B2.30203@namesys.com>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org> <20040828170515.GB24868@hh.idb.hist.no> <Pine.LNX.4.58.0408281038510.2295@ppc970.osdl.org> <4131074D.7050209@namesys.com> <Pine.LNX.4.58.0408282159510.2295@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0408282159510.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Helge Hafting <helgehaf@aitel.hist.no>, Rik van Riel <riel@redhat.com>, Spam <spam@tnonline.net>, Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com, Al Viro <viro@parcelfarce.linux.theplanet.co.uk>

Linus Torvalds wrote:

>On Sat, 28 Aug 2004, Hans Reiser wrote:
>  
>
>>I object to openat().....
>>    
>>
>
>Sound slike you object to O_XATTRS, not openat() itself.
>
>Realize that openat() works independently of any special streams, it's
>fundamentally a "look up name starting from this file" (rather than
>"starting from root" or "starting from cwd").
>
>		Linus
>
>
>  
>
well, isn't that namespace fragmentation by definition?  If you can't go

cat filenameA/metas/permissions > filenameB/metas/permissions

find / -exec cat {}/permissions \; | grep 4777 | wc -l

then aren't you missing the whole point of this exercise which is to 
allow the whole OS to be better integrated into a more unified namespace 
so that data can leap from one tool to another, and one container to 
another, with the greatest of ease?  If cat cannot access the metadata 
without changing the code of cat, then all the elegance goes poof.

It completely baffles me what disabling filenameA/.. does for us.  Why 
add asymmetries?  Ease of implementation is no excuse for such asymmetry.

Tomorrow I am going to send a little essay I wrote this evening on these 
metafiles.
