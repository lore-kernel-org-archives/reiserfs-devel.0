From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 15:20:26 +0100
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <1093789225.27932.39.camel@localhost.localdomain>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
	 <20040825200859.GA16345@lst.de>
	 <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Mer, 2004-08-25 at 21:22, Linus Torvalds wrote:
>  - without the slash, a file-as-dir won't open with O_DIRECTORY (ENOTDIR)
>  - with the slash, it won't open _without_ O_DIRECTORY (EISDIR)
> 
> Problem solved. Very user-friendly, and very intuitive.

Breaks bash and almost all other file completion 8)

