From: Jan Kara <jack@suse.cz>
Subject: Re: [2.6.11-rc2] kernel BUG at fs/reiserfs/prints.c:362
Date: Thu, 27 Jan 2005 12:26:48 +0100
Message-ID: <20050127112647.GA20806@atrey.karlin.mff.cuni.cz>
References: <200501271024.13778.rathamahata@ehouse.ru> <1106821035.3270.30.camel@tribesman>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23219-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1106821035.3270.30.camel@tribesman>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: "Sergey S. Kostyliov" <rathamahata@ehouse.ru>, reiserfs-list@namesys.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, admin@list.net.ru

  Hello,

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
  BTW: What are the exact rules where lock_kernel() should be held for
reiserfs? Is there a doc somewhere? I suspect we might need the lock
also for reiserfs_quota_read() (reiserfs_quota_write() should be
already protected by your fix).
  Hmm, I should also check ext2/ext3 whether it needs the lock...

								Honza

-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs
