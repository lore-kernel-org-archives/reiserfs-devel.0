From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck --rebuild-tree fails
Date: Mon, 8 Jul 2002 15:31:40 +0400
Message-ID: <20020708153140.A2245@namesys.com>
References: <E17RWbs-0003yZ-00@oblik.dp.ua>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10923-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <E17RWbs-0003yZ-00@oblik.dp.ua>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yurick@oblik.dp.ua
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jul 08, 2002 at 02:23:16PM +0300, yurick@oblik.dp.ua wrote:
>    Pass 1 (will try to insert 21881 leaves):                                    
>    ####### Pass 1 #######                                                       
>    Looking for allocable blocks .. ok                                           
>    0%.build_the_tree: nothing but leaves are expected. Block 9938 - ??          
>    ...20%....40%....                                                            
>    mark_block_used: (448579) used already                                       

This one is very clear sign of broken memory or broken data exchange between
HDD and the box itself.
Try changing IDE cable/replacing memory/putting the HDD into other box.

Bye,
    Oleg
