From: Vijayan Prabhakaran <pvijayan@gmail.com>
Subject: Bug in data journaling patch ?!
Date: Sat, 14 Aug 2004 12:45:08 -0500
Message-ID: <d68fdf7d040814104533db0818@mail.gmail.com>
Reply-To: Vijayan Prabhakaran <pvijayan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20291-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'm using Reiserfs on Linux 2.4.25 with the data journaling patch from
 ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.25/.

I came across the following aberrant behavior and further
investigation led me to believe that there could be a bug in the data
journaling patch.

I ran a sequential-write workload that wrote 1 MB of data and finally
issued a fsync. I collected the block level trace and found that the
fsync() call returned _before_ flushing the journal data. This
happened in data journaling mode. The same behavior occured in ordered
journaling mode also. That is, the fsync call returned even before any
of the data was written.

I looked at the code and I guess this was caused by the data journaling patch.

Bug description:
----------------

In journal.c there is a function called do_journal_end(). There is
line in that function that initializes commit_trans_id. It looks like:

commit_trans_id = jl->j_trans_id;

The value of jl->j_trans_id was 0 (this could be due to some memset()).

Because commit_trans_id was 0, a later "if" condition failed. And, as
a result, the journal data didn't get flushed to disk. The "if"
condition looks like:

if (journal_list_still_alive(p_s_sb, commit_trans_id))
          flush_commit_list(p_s_sb, jl, 1) ;


Bug fix:
--------

I changed the commit_trans_id initialization to the following and the
code worked fine.

commit_trans_id = SB_JOURNAL(p_s_sb)->j_trans_id ;


I'd greatly appreciate if someone can see if this really is a bug and
if the fix is appropriate.

Thanks,
Vijayan
