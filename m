From: "Sergey S. Kostyliov" <rathamahata@ehouse.ru>
Subject: Re: [2.6.11-rc2] kernel BUG at fs/reiserfs/prints.c:362
Date: Thu, 27 Jan 2005 15:52:47 +0300
Message-ID: <200501271552.48586.rathamahata@ehouse.ru>
References: <200501271024.13778.rathamahata@ehouse.ru> <1106821035.3270.30.camel@tribesman>
Reply-To: "Sergey S. Kostyliov" <rathamahata@ehouse.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23220-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1106821035.3270.30.camel@tribesman>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, admin@list.net.ru

On Thursday 27 January 2005 13:17, Vladimir Saveliev wrote:
> Hello
> 
> On Thu, 2005-01-27 at 10:24, Sergey S. Kostyliov wrote:
> > Hello all,
> > 
> > Here is a BUG() I've just hited on quota enabled reiserfs disk.
> > 
> > rathamahata@dev rathamahata $ mount | grep /dev/sdb2
> > /dev/sdb2 on /var/www type reiserfs (rw,noatime,nodiratime,data=writeback,grpquota,usrquota)
> > rathamahata@dev rathamahata $
> > 
> > REISERFS: panic (device sdb2): journal_begin called without kernel lock held
> 
> Would you check whether this patch helps, please?
That fixes it. Thank you!

-- 
Sergey S. Kostyliov <rathamahata@ehouse.ru>
Jabber ID: rathamahata@jabber.org
