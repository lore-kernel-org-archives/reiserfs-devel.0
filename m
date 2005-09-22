From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Identify Superblock
Date: Thu, 22 Sep 2005 12:32:05 +0400
Message-ID: <200509221232.05942.vitaly@namesys.com>
References: <20050922011103.GA6789@lune>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26226-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050922011103.GA6789@lune>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Markus Hiereth <markus.hiereth@ngi.de>

On Thursday 22 September 2005 05:11, Markus Hiereth wrote:
> Hello,
> 
> as YaST and fdisk showed different output for the partions of my
> hard-disk, I got confused and lost the correct start point for my
> partition /dev/hda5.
> 
> Recreation of superblocks by reiserfsck --rebuild-sb creates a
> superblock, but afterwards, --rebuild-tree terminates with a message
> that no metadata can be found. 
> 
> Now I am trying to find out which of the blocks is the superblock. I
> made first attempts with
> a) copying using the command dd and then
> b) use of grep ReIsEr2Fs as search string on blocks of 4096 bytes.
> 
> Techical background information
>  reiserfs: 3.6.9
>  Kernel: 2.4.21
>  Hard disk: Maxtor 9084006
>  
> Is this a possible approach?

yes, although there are many SB copies in the journal area.
the magic string of the correct SB is on 64K + 52 bytes offset. 
if you need our assistance here please visit:
www.namesys.com/support.html

> Thanks for Your help
> Markus Hiereth
> 
> Braunschweig, Germany
> 
> 

-- 
Thanks,
Vitaly Fertman
