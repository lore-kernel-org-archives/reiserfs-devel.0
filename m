From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Reiser4 mount support, Grub support
Date: Fri, 20 Aug 2004 00:38:50 +0400
Message-ID: <20040819203850.GR5154@backtop.namesys.com>
References: <e7963922040819082125b7d8aa@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20411-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <e7963922040819082125b7d8aa@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Schweizer <sschweizer@gmail.com>
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

On Thu, Aug 19, 2004 at 05:21:04PM +0200, Stefan Schweizer wrote:
> Hi,
> 
> is there a patch for util-linux to support reiser4 w/o -t reiser4 in mount?

add reiser4 to the list in /etc/filesystems ?


> The grub support is not really ready yet.
> Symlinks do not work.
> And if I try to specify the direct path it is accepted.
> But when I try to boot it says invalid compress format  :(
> 
> 
> Stefan Schweizer

-- 
Alex.
