From: Oleg Drokin <green@namesys.com>
Subject: Re: inode generation numbers
Date: Thu, 11 Sep 2003 11:03:19 +0400
Message-ID: <20030911070319.GA28563@namesys.com>
References: <200309092108.37805.bernd-schubert@web.de> <20030909140751.E18851@schatzie.adilger.int> <200309100053.23352.bernd-schubert@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15626-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200309100053.23352.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd-schubert@web.de>
Cc: Andreas Dilger <adilger@clusterfs.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hello!

On Wed, Sep 10, 2003 at 12:53:22AM +0200, Bernd Schubert wrote:

> It also works for reiserfs-partitions with the very same call, @reiserfs-team, 
> this won't change in the future, will it?

Yes, it is in there just to be compatible with ext2.

Be warned that on v3.5 filesystems this generation stuff is weakly implemented
and defaults to object id of parent directory.

Bye,
    Oleg
