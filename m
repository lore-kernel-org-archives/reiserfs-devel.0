From: Oleg Drokin <green@namesys.com>
Subject: Re: fast approximate file count
Date: Sun, 22 Sep 2002 00:35:46 +0400
Message-ID: <20020922003546.A19135@namesys.com>
References: <E17scwJ-0003ij-00@yodel.jab.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11514-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <E17scwJ-0003ij-00@yodel.jab.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Breidenbach <jeff@jab.org>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Sep 20, 2002 at 10:36:23PM -0700, Jeff Breidenbach wrote:
> While "find $DIR | wc -l" works and is quite accurate, it can take an
> enormously long time. While "df" and dividing by a guesstimate of
> the average file size is fast, I wonder if there is a way to do
> better. Is there a prgram that can take advantage of reiserfs
> specific metadata and quickly compute an approximate file count?
> Especially if the directory tree structure is very shallow?

If you never/very seldom delete files,
you can create new file (any size), execute ls -i on it, like this:
 549661 z

This number is OID, oid grows up in case that there were no deletions/gaps
from previous deletions in OID.
OID is total number of objects on FS in this case.

Counting is started from 2 for root dir. objects are files and directories.

Bye,
    Oleg
