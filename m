From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 12:53:26 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <41323436.80007@namesys.com>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org> <20040828170515.GB24868@hh.idb.hist.no> <Pine.LNX.4.58.0408281038510.2295@ppc970.osdl.org> <4131074D.7050209@namesys.com> <Pine.LNX.4.58.0408282159510.2295@ppc970.osdl.org> <4131A3B2.30203@namesys.com> <Pine.LNX.4.58.0408291055140.2295@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0408291055140.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Helge Hafting <helgehaf@aitel.hist.no>, Rik van Riel <riel@redhat.com>, Spam <spam@tnonline.net>, Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com, Al Viro <viro@parcelfarce.linux.theplanet.co.uk>

Linus Torvalds wrote:

>On Sun, 29 Aug 2004, Hans Reiser wrote:
>  
>
>>>Realize that openat() works independently of any special streams, it's
>>>fundamentally a "look up name starting from this file" (rather than
>>>"starting from root" or "starting from cwd").
>>>      
>>>
>>well, isn't that namespace fragmentation by definition?
>>    
>>
>
>No.
>
>There's no difference between
>
>	fd = open("/usr/bin/yes", O_RDWR);
>
>and
>
>	dirfd = open("/usr/bin", O_RDONLY | O_DIRECTORY);
>	fd = openat(dirfd, "yes", O_RDWR);
>  
>
The difference is that cat uses open() not openat().

With your model, can I do:

cat filenameA/metas/permissions > filenameB/metas/permissions

find / -exec cat {}/permissions \; | grep 4777 | wc -l

If yes, then we are talking past each other somehow rather than 
disagreeing. If metafiles can be opened with both open and openat() in 
your model, then we are discussing some small detail.

I think the answer is no though, in which case you are missing the point 
of the new design. Is the answer no?

