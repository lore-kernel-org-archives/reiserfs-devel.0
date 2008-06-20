From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Minor but irritating Reiser4 problem
Date: Fri, 20 Jun 2008 11:27:42 +0400
Message-ID: <485B5BEE.50507@gmail.com>
References: <1CCA8592-A78B-4DC8-AF53-ACD69CAE14C4@jasonandannette.us> <485AD5FA.7090809@gmail.com> <000001c8d29b$2dfdc9f0$89f95dd0$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <000001c8d29b$2dfdc9f0$89f95dd0$@net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steven Noonan <steven.noonan@uplinklabs.net>
Cc: reiserfs-devel@vger.kernel.org

Steven Noonan wrote:
> I've been using Reiser4 on a 2.6.25 kernel and I've noticed that file sizes
> and disk space usage are incorrectly reported (impossibly large). The
> problem -seemed- to be temporarily resolved by running fsck.reiser4 on the
> filesystem or after switching to 2.6.26-rc5-mm3 (not sure which), and fsck
> reported lots of these:
>
> FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item (21), 
> [2a:c66170725f646264:10332] (stat40): wrong bytes (65536), Fixed to (10181).
>
>   

This is expected behavior (which should be fixed): kernel doesn't support
i_blocks and i_bytes, and fsck checks them. Use an fsck option -s to avoid
complaints when checking a partition formatted by ccreg40 option.

Thanks,
Edward.


> In every case, it says "wrong bytes (65536)" and corrects the number. Any
> idea which "bytes" it's referring to? It seems too small to be a file size
> (since 16-bit file size descriptors would be ridiculously small). I would
> expect -at least- a 64-bit number to represent a file size.
>
> I'd try debugging it myself, but I'm afraid of touching (and unfamiliar
> with) Reiser4's internals.
>
> - Steven
>
>   
> ------------------------------------------------------------------------
>
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
>
> Fscking the /dev/sda8 block device. 
> Will fix minor corruptions of the Reiser4 SuperBlock. 
> Will fix minor corruptions of the Reiser4 FileSystem. 
> ***** fsck.reiser4 started at Thu Jun 19 22:43:34 2008
> Reiser4 fs was detected on /dev/sda8. 
> Master super block (16): 
> magic:		ReIsEr4 
> blksize:	4096 
> format:		0x0 (format40) 
> uuid:		2a8956ea-2ad1-4a65-8f51-277e3859c5a9 
> label:		<none> 
>  
> Format super block (17): 
> plugin:		format40 
> description:	Disk-format plugin. 
> version:	0 
> magic:		ReIsEr40FoRmAt 
> mkfs id:	0x24a1ff7f 
> flushes:	0 
> blocks:		1048240 
> free blocks:	619370 
> root block:	428061 
> tail policy:	0x2 (smart) 
> next oid:	0x1034e 
> file count:	825 
> tree height:	4 
> key policy:	LARGE 
>  
>  
> CHECKING THE STORAGE TREE 
> 	Read nodes 19660 
> 	Nodes left in the tree 19660 
> 		Leaves of them 19421, Twigs of them 233 
> 	Time interval: Thu Jun 19 22:43:35 2008 - Thu Jun 19 22:43:39 2008 
> CHECKING EXTENT REGIONS. 
> 	Read twigs 233 
> 	Time interval: Thu Jun 19 22:43:39 2008 - Thu Jun 19 22:43:39 2008 
> CHECKING THE SEMANTIC TREE 
> FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428120), item (1), 
> [2a:41726368697665:10001] (stat40): wrong bytes (65536), Fixed to (42406). 
>   
[...]


