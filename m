From: Will Dyson <will_dyson@pobox.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 11:50:10 -0400
Message-ID: <412E06B2.7060106@pobox.com>
References: <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org> <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org> <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk> <20040826001152.GB23423@mail.shareable.org> <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk> <20040826010049.GA24731@mail.shareable.org> <20040826100530.GA20805@taniwha.stupidest.org> <20040826110258.GC30449@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20704-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826110258.GC30449@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jamie Lokier <jamie@shareable.org>
Cc: Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Jamie Lokier wrote:

> However, as far as I know it's not accessible in a file-as-directory
> form as yet.  In my opinion that is the most natural form and it would
> be very intuitive to use.  I hope we can pick a useful semantics for
> them, and also provide filesystem-independent plugins with GNU
> Hurd-like per-user extensibility.
> 
> -- Jamie
> 
> * plenty == too much.
>   Gnome, KDE, Emacs and Bash all see different virtual filesystems.
>   (All but Bash implement their own virtual filesystem extensions).
>   That makes them much less useful than they could be.

It has always bugged me that Gnome and KDE implement their own VFS layers.

It seems to me that having a standard userspace filesystem layer like 
FUSE (http://sourceforge.net/projects/avf) would provide a lot of the 
benefit that HURD users (all 5 of them) see from filesystem 
"translators". Now, safely allowing unprivileged users to run arbitrary 
userspace filesystems would be a real trick. But, if it were possible, 
it could be combined with files-as-directories in some rather neat ways.

-- 
Will Dyson
"Back off man, I'm a scientist!" -Dr. Peter Venkman
