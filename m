From: "Matthias Urlichs" <smurf@noris.de>
Subject: Re: Bug in reiserfsck 3.6.1-pre1
Date: Mon, 16 Sep 2002 09:35:21 +0200
Message-ID: <20020916093520.C10175@noris.de>
References: <20020916025655.E22362@noris.de> <20020916091943.A5459@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11462-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020916091943.A5459@namesys.com>; from green@namesys.com on Mon, Sep 16, 2002 at 09:19:43AM +0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hi,

Oleg Drokin:
> We are interested in metadata from that volume if possible.
> Please run debugreiserfs -p /dev/md0 | gzip -9c >/somewhere/metadata_md0.gz
> 
Will do, as soon as the save-state re-run from reiserfsck is done and if
it still exhibits the problem.  :-/

> Then make this file available for us to download.
> 
Warning: that'll be 100+ MBytes. Compressed. (The original RAID's almost
half a terabyte.)

-- 
Matthias Urlichs     |     noris network AG     |     http://smurf.noris.de/
