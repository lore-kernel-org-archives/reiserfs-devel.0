From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH]: reiser4 [5/8] export remove_from_page_cache()
Date: Thu, 31 Oct 2002 16:18:26 +0000
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20021031161826.A9747@infradead.org>
References: <15809.21559.295852.205720@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15809.21559.295852.205720@laputa.namesys.com>; from Nikita@Namesys.COM on Thu, Oct 31, 2002 at 07:03:03PM +0300
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Linus Torvalds <Torvalds@Transmeta.COM>, Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Thu, Oct 31, 2002 at 07:03:03PM +0300, Nikita Danilov wrote:
> Hello, Linus,
> 
>     Following patch exports remove_from_page_cache(). reiser4 stores all
>     meta-data in the page cache. When piece of meta-data is removed,
>     corresponding page has to be removed from the page cache (this is
>     similar to truncate, but for meta-data), explicit call to
>     remove_from_page_cache() is required at this point.

Could you please explain the code that needs it?  No one should
call this in individual filesystem drivers.
