From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: How to build a big file server
Date: Thu, 5 Jun 2003 11:51:01 +0200
Message-ID: <20030605095101.GH4769@hvs.envisage.co.za>
References: <1054800852.1997.15.camel@wusel.schnulli.de> <3EDEFE7A.1090502@gmx.net> <20030605025554.J1522@schatzie.adilger.int>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14420-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030605025554.J1522@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, Heinz-Josef Claes <hjclaes@web.de>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Jun 05, 2003 at 02:55:54AM -0600, Andreas Dilger wrote:
> 
> The other problem I've heard of with hardware RAID is that if you do not
> have another of exactly the same RAID controller, it may be impossible to
> get your data back if the controller fails.  If you are planning on making
> many similar servers, that may not be a problem, but is always something
> to be aware of with hardware RAID.

True.

They write meta information on the disks saying this disk is part of this
mirror in this configuration. Then the higher end versions even have copies
in NVRAM *and* the disks, to check whether the disks have been moved etc.

Thus, beware in the "cheap" cases... though the bigger OEMs (Dell/IBM/etc.)
which have support contracts etc. you would be able to get a replacement
part (if it's not too old ;^)

Hendrik
