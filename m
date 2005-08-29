From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: tail option limit
Date: Mon, 29 Aug 2005 14:46:06 -0400
Message-ID: <1125341166.5544.148.camel@localhost.localdomain>
References: <1125326954.5544.67.camel@localhost.localdomain>
	 <43134D5E.5090102@namesys.com>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25705-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43134D5E.5090102@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs <reiserfs-list@namesys.com>

On Mon, 2005-08-29 at 22:01 +0400, Vladimir V. Saveliev wrote:
> Hello
> 
> Ming Zhang wrote:
> > Hi,
> > 
> > I saw from document that small files will be packed into meta-data thus
> > save an extra data block read.
> > 
> > how small is the boundary? i guess it has related with file block size.
> > 
> > assume it is 4KB by default.
> > 
> > so will
> > 
> > < 4KB be packed?
> > 
> > = 4KB be packed?
> > 
> >>4KB be packed? (it is NO here i bet.)
> > 
> 
> It depends.
> reiserfs by default packs into metadata blocks only last incomplete block of file. It is called tail.
> For example, if file is 4098 bytes long - first 4096 bytes are stored in full data block (so called unformatted node).
> 2 last bytes (tail) are stored in one or two meta data blocks.

one or two? u mean there is a change that 2 bytes will be stored in 2
meta-data blocks? that is kind of weired.


> Files longer 4 * 4096 never get their data stored in meta data blocks.
> Tail size depends on file size.
> The code looks like:
> 
> #define STORE_TAIL_IN_UNFM_S1(n_file_size,n_tail_size,n_block_size) \
> (\
>   (!(n_tail_size)) || \
>   (((n_tail_size) > MAX_DIRECT_ITEM_LEN(n_block_size)) || \
>    ( (n_file_size) >= (n_block_size) * 4 ) || \
>    ( ( (n_file_size) >= (n_block_size) * 3 ) && \
>      ( (n_tail_size) >=   (MAX_DIRECT_ITEM_LEN(n_block_size))/4) ) || \
>    ( ( (n_file_size) >= (n_block_size) * 2 ) && \
>      ( (n_tail_size) >=   (MAX_DIRECT_ITEM_LEN(n_block_size))/2) ) || \
>    ( ( (n_file_size) >= (n_block_size) ) && \
>      ( (n_tail_size) >=   (MAX_DIRECT_ITEM_LEN(n_block_size) * 3)/4) ) ) \
> )
> 

too many ( and ) need to count. ;)

so here MAX_DIRECT_ITEM_LEN
http://lxr.linux.no/source/include/linux/reiserfs_fs.h#L1606 is 3976
with block size 4K by default.

assume a file is 4095. then n_file_size = 4095 and n_tail_size = 4095,
so this define will return 1. then what will be the impact? i went
through the code a bit and think this lead not to do packed?

> 
> Reiser4 by default stores whole file in metadata blocks if it is shorter than 16384.
> Longer files are stored in full data blocks completely.
> 

so more files will be in tails.


> 
> > Thanks!
> > 
> > Ming
> > 
> > 
> > 
> 

