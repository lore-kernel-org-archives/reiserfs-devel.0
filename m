From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfs_open: bread failed reading block 16
Date: Wed, 3 Apr 2002 09:20:55 +0400
Message-ID: <20020403092055.A5947@namesys.com>
References: <20020402223803.623FC6412@angband.namesys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020402223803.623FC6412@angband.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Govardhan <govar@thinkpix.com>
Cc: vs@namesys.com, reiserfs-list@namesys.com

Hello!

On Tue, Apr 02, 2002 at 05:38:21PM -0500, Govardhan wrote:
> reiserfs_open: bread failed reading block 16
> reiserfs_open: bread failed reading block 2
> reiserfs_open: neither new nor old reiserfs format found on /dev/md1

So it cannot read any data off the raid.
Make sure you did raidstart on this device.

Bye,
    Oleg
