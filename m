From: Matthias Andree <matthias.andree@gmx.de>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Mon, 31 Jul 2006 22:07:18 +0200
Message-ID: <20060731200718.GA13257@merlin.emma.line.org>
References: <20060731175958.1626513b.reiser4@blinkenlights.ch> <20060731165406.GA8526@merlin.emma.line.org> <20060731195621.367ed702.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29323-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060731195621.367ed702.reiser4@blinkenlights.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: Matthias Andree <matthias.andree@gmx.de>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Adrian Ulrich schrieb am 2006-07-31:

> Ehr: Such a migration (on a very busy system) takes *some* time (weeks).
> Re-Doing (migrate users back / recreate the FS / start again) the whole
> thing isn't really an option..

All the more important to think about FS requirements *before*
newfs-ing if a quick "one day for rsync/star/dump+restore" isn't
available. If you're hitting, for instance, the hash collision problem
in reiser3, you're as dead as with a FS without inodes.

> > > Have you ever seen VxFS or WAFL in action?
> > 
> > No I haven't. As long as they are commercial, it's not likely that I
> > will.
> 
> Why?

I'm trying to shift my focus away from computer administration and
better file systems than old-style non-journalling, non-softupdates UFS
are available today and more will follow.

Cc: list weeded out.

-- 
Matthias Andree
