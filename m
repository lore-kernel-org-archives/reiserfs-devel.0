From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 19:36:29 +0100
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040829183629.GP21964@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com> <412F7D63.4000109@namesys.com> <20040827230857.69340aec.pj@sgi.com> <20040829150231.GE9471@alias> <4132205A.9080505@namesys.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4132205A.9080505@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: flx@msu.ru, Paul Jackson <pj@sgi.com>, riel@redhat.com, ninja@slaphack.com, torvalds@osdl.org, diegocg@teleline.es, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Sun, Aug 29, 2004 at 11:28:42AM -0700, Hans Reiser wrote:
> just use a view, and skip the options on the system calls.  if you cd to 
> /nometas/your_home_directory_path you don't see the metafiles.  Why is a 
> view better than a syscall flag?  Because it lets the user choose what 
> he wants without recompiling to do it.  This kind of a view requires no 
> coding because you can just mount the root filesystem two ways, one with 
> the -nopseudos mount option, and one without it.

*What*?

OK, now I want detailed explanation of the reasons why that doesn't create
cache coherency problems.

Do you have an analysis of locking in the entire thing?
