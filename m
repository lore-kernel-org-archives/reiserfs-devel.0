From: Chris Mason <mason@suse.com>
Subject: Re: Benchmarks from Guru Labs
Date: 18 Jul 2002 09:02:22 -0400
Message-ID: <1026997343.3188.26.camel@tiny>
References: <20020718115327.GE3841@ariel.karmak.org>
	<1026995065.2486.5.camel@tiny> 
	<200207181342.19138.tdickenson@geminidataloggers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11047-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200207181342.19138.tdickenson@geminidataloggers.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Toby Dickenson <tdickenson@geminidataloggers.com>
Cc: Michael Carmack <karmak@karmak.org>, reiserfs-list@namesys.com

On Thu, 2002-07-18 at 08:42, Toby Dickenson wrote:
> On Thursday 18 Jul 2002 1:24 pm, Chris Mason wrote:
> 
> > notail is faster in most cases.  With some tail tuning, tails could be
> > faster for synchronous applications (like mail servers) when the file
> > size is <= blocksize.  This is because flushing the tail to disk would
> > be free with flushing the new inode information.
> 
> Is there any way to control the size of tails that get merged?
> 
> I have an application for which notail gives a performance increase, but I 
> also have a majority of files sized under 10 bytes, so notail is a big space 
> penalty
> 
> I suspect I _might_ be able to get a nice compomise if it was possible to 
> "tail" the tiny files, and "notail" the larger ones.
> 
> (alternatively, Im looking at two different filesystems, with one mounted 
> "notail")

At one point in time, there was a patch floating around that made this a
mount option (Nikita's?)  But right now all you can do is change the
STORE_TAIL_IN_UNFM macro in reiserfs_fs.h

There are really only two rules.  #1 you don't want a tail when the tail
size is zero.  #2 The tail can't be bigger than MAX_DIRECT_ITEM_LEN.

Something like this would only make tails for files < 4k in size (but
you should check my paren matching)  it should read

if (!n_tail_size || (n_tail_size > max_direct_item_len || 
                     n_file_size > n_block_size)
    return 1

#define STORE_TAIL_IN_UNFM(n_file_size,n_tail_size,n_block_size) \
(\
  (!(n_tail_size)) || \
  (((n_tail_size) > MAX_DIRECT_ITEM_LEN(n_block_size)) || \
   (n_file_size) >= (n_block_size)) \
)

-chris



