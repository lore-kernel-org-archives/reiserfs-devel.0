From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfs_open: bread failed reading block 16
Date: Wed, 3 Apr 2002 13:36:01 +0400
Message-ID: <E16shAw-0007ZM-00@main.gmane.org>
References: <20020402223803.623FC6412@angband.namesys.com> <20020403092055.A5947@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020403092055.A5947@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Govardhan <govar@thinkpix.com>
Cc: vs@namesys.com, reiserfs-list@namesys.com

On Wednesday 03 April 2002 09:20, Oleg Drokin wrote:
> Hello!
>
> On Tue, Apr 02, 2002 at 05:38:21PM -0500, Govardhan wrote:
> > reiserfs_open: bread failed reading block 16
> > reiserfs_open: bread failed reading block 2
> > reiserfs_open: neither new nor old reiserfs format found on /dev/md1
>
> So it cannot read any data off the raid.
> Make sure you did raidstart on this device.


And please take reiserfsprgs-3.x.1b from our ftp site.

-- 

Thanks,
Vitaly Fertman
