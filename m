From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: AMD64 progress?
Date: Fri, 14 Jan 2005 16:58:14 -0600
Message-ID: <1105743495.9018.13.camel@gentoo>
References: <1105594407.32495.8.camel@gentoo>
	 <20050114201751.GB5883@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23147-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050114201751.GB5883@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

I used the 2.6.10-1 patch on an otherwise vanilla 2.6.10. The filesystem
tested was freshly created with 1.0.3. I did my usual dd and kernel
compile. After the kernel compilation failed, all sorts of processes
just hung, even simple stuff like copying and removing files on other
filesystems. 

reiser4[cc1(11377)]: check_blocks_bitmap (fs/reiser4/plugin/space/bitmap.c:1203)[zam-623]:
code: -2 at fs/reiser4/search.c:1285
reiser4 panicked cowardly: assertion failed: reiser4_find_next_zero_bit(bnode_working_data(bnode), end_offset, start_offset) >= end_offset
----------- [cut here ] --------- [please bite here ] ---------
Kernel BUG at debug:131
invalid operand: 0000 [1] 
CPU 0 
Modules linked in: ipv6 i2c_dev it87 i2c_sensor i2c_isa i2c_core ipt_state ip_conntrack iptable_filter ip_tables snd_ioctl32 snd_seq snd_seq_device snd_pcm_oss snd_mixer_oss 3c59x e1000 snd_intel8x0 snd_ac97_codec snd_pcm snd_timer snd soundcore snd_page_alloc ehci_hcd ohci_hcd
Pid: 11377, comm: cc1 Not tainted 2.6.10+reiser4
RIP: 0010:[<ffffffff801bf010>] <ffffffff801bf010>{reiser4_do_panic+704}
RSP: 0018:00000100168116e8  EFLAGS: 00010246
RAX: ffffffff8052f4e0 RBX: 0000010016811db8 RCX: ffffffff8052f4e0
RDX: 000001001df1de88 RSI: 000001001df1de88 RDI: 000001001cb2ec00
RBP: ffffff00006e8090 R08: 0000000000000000 R09: 000000000000000d
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000001ce2
R13: 0000000000000001 R14: 0000000000001c81 R15: 0000000000001c81
FS:  0000002a95863ae0(0000) GS:ffffffff80546e80(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000002a95fb8000 CR3: 0000000000101000 CR4: 00000000000006e0
Process cc1 (pid: 11377, threadinfo 0000010016810000, task 00000100019bb4f0)
Stack: 0000003000000010 00000100168117c8 0000010016811708 0000000000002c71 
       ffffffff803fc0f0 ffffffff8042e4c8 0000000000000000 0000000000000000 
       0000000000000000 0000000000000003 
Call Trace:<ffffffff80208acd>{reiser4_block_count+77} <ffffffff801bf2c9>{schedulable+9} 
       <ffffffff8027b5d5>{load_and_lock_bnode+101} <ffffffff8027ab66>{parse_blocknr+326} 
       <ffffffff801bf175>{reiser4_print_prefix+133} <ffffffff801bf049>{report_err+9} 
       <ffffffff8027c18e>{check_blocks_bitmap+1134} <ffffffff801e3a06>{reiser4_check_block+22} 
       <ffffffff801c69d3>{zget+1075} <ffffffff801ff950>{cbk_level_lookup+112} 
       <ffffffff801ff5fd>{cbk_node_lookup+2445} <ffffffff801d5202>{lock_tail+1298} 
       <ffffffff801d33a5>{znode_is_any_locked+37} <ffffffff801c2544>{check_jload+52} 
       <ffffffff801c46e4>{jload_gfp+1092} <ffffffff801d4815>{move_lh_internal+1429} 
       <ffffffff80200895>{traverse_tree+1749} <ffffffff802017e3>{object_lookup+915} 
       <ffffffff80282c65>{find_file_item+565} <ffffffff8024fed0>{read_tail+0} 
       <ffffffff802853cc>{read_file+524} <ffffffff801e785a>{txn_end+218} 
       <ffffffff80285cc0>{read_unix_file+736} <ffffffff801dc525>{done_context+773} 
       <ffffffff80214185>{reiser4_lookup+485} <ffffffff802146fc>{reiser4_getattr+332} 
       <ffffffff802159c5>{reiser4_read+485} <ffffffff80164d14>{vfs_read+228} 
       <ffffffff80164fc3>{sys_read+83} <ffffffff8010d19a>{system_call+126} 
       

Code: 0f 0b 4d ad 40 80 ff ff ff ff 83 00 48 c7 c6 a0 f0 52 80 48 
RIP <ffffffff801bf010>{reiser4_do_panic+704} RSP <00000100168116e8>
 
On Fri, 2005-01-14 at 23:17 +0300, Alex Zarochentsev wrote:
> On Wed, Jan 12, 2005 at 11:33:27PM -0600, Jake Maciejewski wrote:
> > There was mention of Namesys getting an AMD64 machine. Do you guys have
> > it yet? Has there been any progress on my reiser4 bug(s), particularly
> > the "reiser4_find_next_zero_bit(bnode_working_data(bnode), end_offset,
> > start_offset) >= end_offset" problem?
> 
> can you test the following patch? I know that amd64 does not require
> strong word aligment, but may be amd64 bitops coded in assembler 
> do that?
> 
> ===== plugin/space/bitmap.c 1.185 vs edited =====
> --- 1.185/plugin/space/bitmap.c	Sun Dec  5 19:49:52 2004
> +++ edited/plugin/space/bitmap.c	Fri Jan 14 23:15:53 2005
> @@ -57,13 +57,15 @@
>  
>  #define CHECKSUM_SIZE    4
>  
> +#define BYTES_PER_LONG   (sizeof(long))
> +
>  #if BITS_PER_LONG == 64
>  #  define LONG_INT_SHIFT (6)
>  #else
>  #  define LONG_INT_SHIFT (5)
>  #endif
>  
> -#define LONG_INT_MASK (BITS_PER_LONG - 1)
> +#define LONG_INT_MASK (BITS_PER_LONG - 1UL)
>  
>  typedef unsigned long ulong_t;
>  
> @@ -182,12 +184,41 @@
>  
>  #include <asm/bitops.h>
>  
> +#if BITS_PER_LONG == 64
> +
> +#define OFF(addr)  (((ulong_t)(addr) & (BYTES_PER_LONG - 1)) << 3)
> +#define BASE(addr) ((ulong_t*) ((ulong_t)(addr) & ~(BYTES_PER_LONG - 1)))
> +
> +static inline void reiser4_set_bit(int nr, void * addr)
> +{
> +	ext2_set_bit(nr + OFF(addr), BASE(addr));
> +}
> +
> +static inline void reiser4_clear_bit(int nr, void * addr)
> +{
> +	ext2_clear_bit(nr + OFF(addr), BASE(addr));
> +}
> +
> +static inline int reiser4_test_bit(int nr, void * addr)
> +{
> +	return ext2_test_bit(nr + OFF(addr), BASE(addr));
> +}
> +static inline int reiser4_find_next_zero_bit(void * addr, int maxoffset, int offset) 
> +{
> +	int off = OFF(addr);
> +
> +	return ext2_find_next_zero_bit(BASE(addr), maxoffset + off, offset + off) - off;
> +}
> +
> +#else
> +
>  #define reiser4_set_bit(nr, addr)    ext2_set_bit(nr, addr)
>  #define reiser4_clear_bit(nr, addr)  ext2_clear_bit(nr, addr)
>  #define reiser4_test_bit(nr, addr)  ext2_test_bit(nr, addr)
>  
>  #define reiser4_find_next_zero_bit(addr, maxoffset, offset) \
>  ext2_find_next_zero_bit(addr, maxoffset, offset)
> +#endif
>  
>  /* Search for a set bit in the bit array [@start_offset, @max_offset[, offsets
>   * are counted from @addr, return the offset of the first bit if it is found,
> 
> 
-- 
Jake Maciejewski <maciejej@msoe.edu>

