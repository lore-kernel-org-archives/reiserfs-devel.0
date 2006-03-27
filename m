From: Toby Thain <toby@smartgames.ca>
Subject: Re: Reiser4 crash 2.6.16-mm1
Date: Mon, 27 Mar 2006 16:58:52 -0500
Message-ID: <C68877DC-ED4F-4827-B6ED-2F5CFEFC8037@smartgames.ca>
References: <20060327214132.4074.qmail@pv105234.reshsg.uci.edu>
Mime-Version: 1.0 (Apple Message framework v746.3)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28365-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060327214132.4074.qmail@pv105234.reshsg.uci.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
Cc: reiserfs-list@namesys.com


On 27-Mar-06, at 4:41 PM, Joe Feise wrote:

> Hi,
> I had an interesting crash on my 2.6.16-mm1 machine earlier today.
> I usually mount /usr/local readonly:
> /dev/sda6 on /usr/local type reiser4 (ro)
> However, since I wanted to update a sw package, I remounted it r/w.
> The installation of the sw package failed with reiser4 errors.  
> Sorry, I don't have a dmesg output at this point, I'll send that  
> tonight when I'm back at the machine.
> But anyway, it reported index errors, and suggested running fsck.
> I then ran an fsck.reiser4 --build-fs, which finished without  
> reporting errors.
> In further tests, I mounted /usr/local rw from the start, and saw  
> the installation fail again. After that, /usr/local/lib was no  
> longer accessible.
> To me, this looks like corruption of some in-memory data structures.

Have you run a memtest lately?

--Toby


> Sorry to not be of more help wrt dmesg output. But I was hoping  
> this is already known somewhere...
> -Joe

