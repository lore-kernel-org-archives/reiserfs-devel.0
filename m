From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: Strange directories after reisferfsck
Date: Tue, 4 Nov 2003 18:16:44 -0800
Message-ID: <20031105021644.GB32687@matchmail.com>
References: <20031104065949.GA11108@p15104972.pureserver.info> <200311041653.03841.vitaly@namesys.com> <20031105010827.GB13208@p15104972.pureserver.info> <3FA85B48.1050202@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15973-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3FA85B48.1050202@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: Kristian Koehntopp <kris@koehntopp.de>, ReiserFS List <reiserfs-list@namesys.com>

On Wed, Nov 05, 2003 at 03:07:04AM +0100, Carl-Daniel Hailfinger wrote:
> Kristian Koehntopp wrote:
> > If so, wouldn't it be useful not only to have a magic byte
> > marker in each data structure, but also a filesystem generation
> > number, that is unique for each filesystem generated, for
> > example the time_t the filesystem was created. Thus metadata
> > structures from vmdk or loop files would have the same magic
> > bytes as metadata from the main filesystem, but would be
> > recognizeable as belonging to a different tree due to the
> > different generation number.
> 
> Yes, but:
> - nobody wants to sponsor that feature
> - reiserfs 3.6 is in feature freeze
> - the on-disk format would be not backwards compatible
> 
> 
> >>reiser4 will be able to keep reiser4 images in files without such 
> >>problems.
> > 
> > 
> > How does it do that?
> 
> By using the ideas you specified. Sorry to disappoint you: your ideas are
> not new, but they are good. Good enough to be incorporated in reiser4.

Does that mean there is no generation number, or random hash in the 3.6
format, or anything else that changes on each fs image that could be keyed
upon?
