From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 19:17:10 -0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <1093821430.8099.49.camel@lade.trondhjem.org>
References: <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com>
	 <412F7D63.4000109@namesys.com> <20040827230857.69340aec.pj@sgi.com>
	 <20040829150231.GE9471@alias> <4132205A.9080505@namesys.com>
	 <20040829183629.GP21964@parcelfarce.linux.theplanet.co.uk>
	 <20040829185744.GQ21964@parcelfarce.linux.theplanet.co.uk>
	 <41323751.5000607@namesys.com>
	 <20040829212700.GA16297@parcelfarce.linux.theplanet.co.uk>
	 <Pine.LNX.4.58.0408291431070.2295@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0408291431070.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Alexander Viro <viro@parcelfarce.linux.theplanet.co.uk>, Hans Reiser <reiser@namesys.com>, flx@msu.ru, Paul Jackson <pj@sgi.com>, riel@redhat.com, ninja@slaphack.com, diegocg@teleline.es, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, Linux Filesystem Development <linux-fsdevel@vger.kernel.org>, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

P=E5 su , 29/08/2004 klokka 17:50, skreiv Linus Torvalds:
> The general VFS layer has a lot of rules, and avoids these problems b=
y
> simply never having aliases between two directories. If the same dire=
ctory
> shows up multiple times (which can happen with bind mounts), they hav=
e the
> exact same dentry for the directory, it's just found through two diff=
erent
> vfsmount instances. That's why vfsmounts exist - they allow the same =
name
> cache entry to show up in different places at the same time.

So could you explain what is stopping us from reducing the whole proble=
m
to the bind mount problem? IOW have "a/" be a directory that acts as if
it is dynamically bind mounted on top of the file "a".


Is it just the fantasy of supporting hard-links across "stream
boundaries" (as in "touch a b; ln b a/b; ln a b/a")? I'm pretty sure
nobody wants to have to add cyclic graph detection to their filesystems
anyway. 8-)

What other issues would need to be addressed?

Cheers,
  Trond
-
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
