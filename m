From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: linux-3.16.2 queue (3.16.1+)
Date: Thu, 28 Aug 2014 08:22:05 -0700
Message-ID: <20140828152205.GA18432@kroah.com>
References: <CAG-aW06Q9VVyW-atZEsURs0rfjysdEbxb_dC4Tm3K-tZg++tQg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAG-aW06Q9VVyW-atZEsURs0rfjysdEbxb_dC4Tm3K-tZg++tQg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt <jackdachef@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

On Thu, Aug 28, 2014 at 05:16:58PM +0200, Matt wrote:
> Hi Greg,
> 
> 
> please consider adding the following 2 patches to 3.16.2:
> 
> Jan Kara (1):
>       reiserfs: Fix use after free in journal teardown
> 
> Jeff Mahoney (1):
>       reiserfs: fix corruption introduced by balance_leaf refactor
> 
> 
> 
> Reason/Related:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=83121
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=83321
> 
> http://forums.gentoo.org/viewtopic-t-998538-postdays-0-postorder-asc-start-0.html
> 
> 
> Many thanks in advance

I need git commit ids of these patches in Linus's tree, can you provide
those please?

thanks,

greg k-h
