From: Vince <fuzzy77@free.fr>
Subject: Re: New reiser4 snapshot (as of August 22, 2003)
Date: Sat, 23 Aug 2003 02:25:59 +0200
Message-ID: <3F46B497.60106@free.fr>
References: <20030822150853.GA960@namesys.com>	 <1061574745.5714.1.camel@pilot.stavtrup-st.dk>	 <16198.22925.274848.501590@laputa.namesys.com>	 <1061575717.21328.4.camel@pilot.stavtrup-st.dk>	 <16198.23850.137603.310946@laputa.namesys.com> <1061596035.21328.10.camel@pilot.stavtrup-st.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15394-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1061596035.21328.10.camel@pilot.stavtrup-st.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Nielsen <Lovechild@foolclan.com>
Cc: reiserfs-list@namesys.com

I worked around this by adding an empty info_atom in reiser4/txnmgr.c :

void
info_atom(const char *prefix, txn_atom * atom)
{
         return;
}

  After that, reiser4 compiles and is running without problem here so 
far (just tried a few minutes of fsx-linux and a few small compilations. 
I'll launch a mozilla-firebird build soon and see if it survives better 
this time).

BTW : compilation as a module is still broken for me, but it could be my 
fault as I'm using an -mm kernel...
(For information, missing symbols are: max_sane_readahead, 
generic_sync_sb_inodes, truncate_mapping_pages_range, 
balance_dirty_pages_ratelimited, inodes_stat, nr_free_pagecache_pages, 
get_full_page_state, destroy_inode)

Sidenote to reiserfs devels : if the merge in mainstream is still far 
away, is any integration of reiser4 into the -mm serie considered ? It 
would ease testing a lot...

Vincent

David Nielsen wrote:
> The entire thing then fails with these messages - no notable compile
> errors or warnings present. 
> 
> fs/built-in.o(.text+0x9a8cd): In function `print_context':
> : undefined reference to `info_atom'
> fs/built-in.o(.text+0x9e392): In function `commit_current_atom':
> : undefined reference to `info_atom'
> fs/built-in.o(.text+0xa0577): In function `print_atom':
> : undefined reference to `info_atom'
> make: *** [.tmp_vmlinux1] Error 1
> 
> Seems this patch might have benefited from a compile test at least? :)
> 
> regards David
> 
> 


