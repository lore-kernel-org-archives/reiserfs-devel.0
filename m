From: Kristian Koehntopp <kris@koehntopp.de>
Subject: Re: Strange directories after reisferfsck
Date: Wed, 5 Nov 2003 17:35:33 +0100
Message-ID: <20031105163533.GA8350@p15104972.pureserver.info>
References: <20031104065949.GA11108@p15104972.pureserver.info> <200311041653.03841.vitaly@namesys.com> <20031105010827.GB13208@p15104972.pureserver.info> <3FA85B48.1050202@gmx.net> <20031105021644.GB32687@matchmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15986-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20031105021644.GB32687@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, Kristian Koehntopp <kris@koehntopp.de>, ReiserFS List <reiserfs-list@namesys.com>


Mike Fedyk wrote:
> > By using the ideas you specified. Sorry to disappoint you:
> > your ideas are not new, but they are good. Good enough to be
> > incorporated in reiser4.

> Does that mean there is no generation number, or random hash
> in the 3.6 format, or anything else that changes on each fs
> image that could be keyed upon?

I do not know a thing about reiserfs, but I'd bet there is a
UUID that is characteristic for the fs in the superblock. Also,
I bet there is an inode generation number in each structure that
is the equivalent of an inode in reiserfs. That number is
necessary for NFS security, and it is independent/different for
each file.
 
For a rebuild to recognize it's own, it would be necessary to
have such a fs specific generation number in each and every data
structure, and for it to be the same for all structures that
belong to a single fs, and to be different for structures that
belong to different fs'es. That's different from both a
superblock UUID and an inode generation number.


Kristian
