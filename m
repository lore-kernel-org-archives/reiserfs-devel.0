From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs on removable media
Date: 02 Jul 2003 14:59:05 -0400
Message-ID: <1057172345.20904.923.camel@tiny.suse.com>
References: <pan.2003.07.02.14.23.09.812119.20132@umail.hungrycats.org>
	 <20030702124544.Z7414@schatzie.adilger.int>  <3F032A33.3050303@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14808-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F032A33.3050303@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Andreas Dilger <adilger@clusterfs.com>, Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

On Wed, 2003-07-02 at 14:53, Hans Reiser wrote:

> >This is called ordered data mode, and exists on ext3 and also reiserfs with
> >Chris Mason's patches.  Under normal usage it shouldn't change performance
> >compared to writeback data mode (which is what reiserfs does by default).
> >
> It had some impact, I forget exactly how much, maybe Chris can 
> resuscitate his benchmark of it?
> 

The major cost of data=ordered is that dirty blocks are flushed every 5
seconds instead of every 30.  The journal header patch in my
experimental data logging directory changes things so that only new
bytes in the file are done in data=ordered mode (either adding a new
block or appending onto the end of the file).

This helps a lot in the file rewrite tests.

-chris


