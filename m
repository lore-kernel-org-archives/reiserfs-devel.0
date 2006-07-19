From: David Masover <ninja@slaphack.com>
Subject: Re: somewhat OT query on journalling
Date: Wed, 19 Jul 2006 14:19:41 -0500
Message-ID: <44BE85CD.4020603@slaphack.com>
References: <20060719152744.GA26155@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29078-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060719152744.GA26155@tranquility.scriptkitchen.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Payal Rathod <payal-fs@scriptkitchen.com>
Cc: reiserfs-list@namesys.com

Payal Rathod wrote:
> Hi,
> I was just reading about filesystems and my ideas are a bit confused.

> And lastly don't the journalling fs give a false sense of security to 
> the user, saying that the data is written to disk when in reality only an 
> entry is made in journal and data is still not committed to disk.

A journaling fs does guarantee one thing:  The filesystem itself is 
consistent.  Any changes you make to the directory structure either 
succeed completely or fail completely.

This means that, while you may lose data, at least you won't lose your 
whole partition.  A non-journaling fs can lose a whole partition this 
way, which is one of the main reasons some people like to split their 
disk up into lots of tiny, specialized partitions.

Last I checked (a year ago, at least) there was an API planned for 
Reiser4 which would make it possible for applications to define their 
own transaction.  Any string of operations you could perform on the fs 
(probably with some limitations) or on a single file could be combined 
into one transaction, which either succeeds entirely, or fails entirely.

So, for instance, if you save a file, there may not be a guarantee that 
the file is written to disk, but there's a guarantee that if the file is 
written to disk, either the whole file was saved, or none of it at all. 
  This is a good thing, because the alternative is to allow some of the 
file to be saved, which almost always means a corrupt file.

Journaling could give a false sense of security if you think it means 
you'll never lose data.  Power fails, disks fail, and the question is 
when you'll lose data, not if.  Make backups, no matter what your FS.

But given the choice, journaling is much better than no journaling.  The 
disadvantage is it slows the system down when implemented poorly.  So 
the solution is to use a journaled filesystem that does it right.
