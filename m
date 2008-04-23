From: Jan Kara <jack@suse.cz>
Subject: Re: Does Reiser3 really support data=journal mode?
Date: Wed, 23 Apr 2008 11:43:20 +0200
Message-ID: <20080423094320.GB32188@duck.suse.cz>
References: <20080422141756.GC22899@duck.suse.cz> <480E2F2B.9060301@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <480E2F2B.9060301@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

On Tue 22-04-08 14:32:11, Jeff Mahoney wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Jan Kara wrote:
> >   Hello,
> > 
> >   I've just looked into the Reiserfs code in 2.6.25 kernel and from the code
> > it seems as data=journal mode isn't really handled any specially from
> > data=writeback mode. So does Reiserfs really support journaling of data?
> > If no, then we should remove the mount option. If yes, then I really wonder
> > where is the distinction from data=writeback mode... Thanks for an answer in
> > advance.
> 
> Check out reiserfs_commit_page() for the code where it is attached to a
> transaction. Then it's handled identically to dirty metadata when the
> transaction is committed.
  Ah, I see, thanks. I was grepping for "reiserfs_data_log" but there is
"reiserfs_file_data_log" which I completely missed.
  Maybe you can help me with my original problem :) - I have a file (quota
file) and I need to make sure that all the dirty data and metadata of that
file is on disk in its final locations (i.e.,  not only in journal). Will
just starting an auxiliary transaction and then doing
  do_journal_end(th, sb, 1, FLUSH_ALL)

  do the work as I think? Thanks.

									Honza 
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
