From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: tail option limit
Date: Mon, 29 Aug 2005 22:01:02 +0400
Message-ID: <43134D5E.5090102@namesys.com>
References: <1125326954.5544.67.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25704-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1125326954.5544.67.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mingz@ele.uri.edu
Cc: reiserfs <reiserfs-list@namesys.com>

Hello

Ming Zhang wrote:
> Hi,
> 
> I saw from document that small files will be packed into meta-data thus
> save an extra data block read.
> 
> how small is the boundary? i guess it has related with file block size.
> 
> assume it is 4KB by default.
> 
> so will
> 
> < 4KB be packed?
> 
> = 4KB be packed?
> 
>>4KB be packed? (it is NO here i bet.)
> 

It depends.
reiserfs by default packs into metadata blocks only last incomplete block of file. It is called tail.
For example, if file is 4098 bytes long - first 4096 bytes are stored in full data block (so called unformatted node).
2 last bytes (tail) are stored in one or two meta data blocks.
Files longer 4 * 4096 never get their data stored in meta data blocks.
Tail size depends on file size.
The code looks like:

#define STORE_TAIL_IN_UNFM_S1(n_file_size,n_tail_size,n_block_size) \
(\
  (!(n_tail_size)) || \
  (((n_tail_size) > MAX_DIRECT_ITEM_LEN(n_block_size)) || \
   ( (n_file_size) >= (n_block_size) * 4 ) || \
   ( ( (n_file_size) >= (n_block_size) * 3 ) && \
     ( (n_tail_size) >=   (MAX_DIRECT_ITEM_LEN(n_block_size))/4) ) || \
   ( ( (n_file_size) >= (n_block_size) * 2 ) && \
     ( (n_tail_size) >=   (MAX_DIRECT_ITEM_LEN(n_block_size))/2) ) || \
   ( ( (n_file_size) >= (n_block_size) ) && \
     ( (n_tail_size) >=   (MAX_DIRECT_ITEM_LEN(n_block_size) * 3)/4) ) ) \
)


Reiser4 by default stores whole file in metadata blocks if it is shorter than 16384.
Longer files are stored in full data blocks completely.


> Thanks!
> 
> Ming
> 
> 
> 

