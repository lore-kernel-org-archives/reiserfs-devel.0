From: Mat <jackdachef@gmail.com>
Subject: Re: reiser4 needs some love with baselayout-2 / openrc
Date: Fri, 18 Jan 2008 17:07:43 +0000 (UTC)
Message-ID: <loom.20080118T170243-359@post.gmane.org>
References: <loom.20080118T124400-9@post.gmane.org> <loom.20080118T131323-824@post.gmane.org> <4790B6FE.60607@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

> Does it help by the way?
> 
> It is safe, but it breaks semantic (some getting-started-with-xxx-plugin 
> docs
> will need to be edited)
> 
> >then gentoo init / baselayout wouldn't halt at printing plugins & omitting
> >checkfs, thus all other following services/tasks
> >

Success ! :D

Yes it defnitely does

now I'm finally able to boot it with:
root=/dev/sda2 ro elevator=deadline vga=794 video=vesafb,ywrap,mtrr

whereas previously I needed
root=/dev/sda2 rw elevator=deadline vga=794 video=vesafb,ywrap,mtrr

(mark the rw !)

here is the updated & working patch:

http://pastebin.ch/72

I hope there's not much additional work fixing syntax for you ...

fyi: I'm using reiser4 with cryptcompress and lzo1 right now (but with default
file plugin it should be the same)

Regards

Mat

