From: =?UTF-8?B?R3J6ZWdvcnogSmHFm2tpZXdpY3o=?= <gj@pointblue.com.pl>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 03 Sep 2004 06:40:10 +0200
Message-ID: <4137F5AA.3020009@pointblue.com.pl>
References: <200408261034.38509.vda@port.imtp.ilyichevsk.odessa.ua> <Pine.LNX.4.44.0408260736080.23532-100000@chimarrao.boston.redhat.com> <20040826121223.GG30449@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21395-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826121223.GG30449@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jamie Lokier <jamie@shareable.org>
Cc: Rik van Riel <riel@redhat.com>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Matt Mackall <mpm@selenic.com>, Nicholas Miell <nmiell@gmail.com>, Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com


Oh, and if I may notice something more. Just my opinion.
It's going to be 'samba uses only' thing, as long as it's not in VFS.
xattrs are not so much needed as file streams there. So argument that 
xattrs exists already in VFS, and are not used, so why do we need 
streams there, and that it wouldn't change anything is just silly.

Btw, reiserfs4 on my laptop is providing very nice base for KDE source 
tree (XFS sucked so much, I had to replace it). Saving me some time on 
recompilation, and cvs up.

Thanks.

--
GJ
