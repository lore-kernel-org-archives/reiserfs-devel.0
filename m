From: Edward Shishkin <edward@namesys.com>
Subject: Re: Nikita 19891
Date: Fri, 13 Jul 2007 19:34:27 +0400
Message-ID: <46979B83.2040809@namesys.com>
References: <20070711044617.GA12129@efil.de>	 <1184128537.10438.16.camel@gentoo>  <4695341B.3000303@namesys.com> <1184303576.8861.12.camel@gentoo>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040309090808030404090005"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1184303576.8861.12.camel@gentoo>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: Ingo Bormuth <ibormuth@efil.de>, reiserfs-devel@vger.kernel.org, "Vladimir V. Saveliev" <vs@namesys.com>

This is a multi-part message in MIME format.
--------------040309090808030404090005
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Jake Maciejewski wrote:

>On Wed, 2007-07-11 at 23:48 +0400, Edward Shishkin wrote:
>  
>
>>Jake Maciejewski wrote:
>>
>>    
>>
>>>I've hit the same panic looping kernel builds (while true ; do make
>>>mrproper ; make allmodconfig ; make -j4 ; done) on 2.6.21.1 with the
>>>Namesys patch and reiser4 debug enabled. I've seen it on my amd64
>>>desktop and x86 laptop.
>>>
>>>Another one I've seen is:
>>>       reiser4 panicked cowardly: reiser4[fixdep(16043)]: sibling_list_remove (fs/reiser4/tree_walk.c:814)[zam-32245]
>>>
>>>In both cases the fsck didn't find anything, as you observed.
>>>
>>>On Wed, 2007-07-11 at 06:46 +0200, Ingo Bormuth wrote:
>>> 
>>>
>>>      
>>>
>>>>Hmm, whenever I try to build busybox (1.4.2) I get nikita-191 panics:
>>>>
>>>>[...]
>>>>cc	console_tools/clear.o
>>>>reiser4 panicked cowardly: reiser4[cc1(13066)]: save_file_hint (fs/reiser4/plugin/file.c:705) [nikity-1991]:
>>>>kernel panic - not syncing: reiser4[cc1(13066)]: save_file_hint (fs/reiser4/plugin/file.c:705) [nikity-1991]:
>>>>   
>>>>
>>>>        
>>>>
>>Somebody missed set_file_hint(), which synchronizes the coords.
>>    
>>
err, sorry, its name is reiser4_set_hint

>>Unfortunately I can not reproduce it. Would you please (if possible)
>>catch the stack with the attached patch?
>>    
>>
>
>[<ffffffff88186b5e>] :reiser4:save_file_hint+0xee/0x3c0
>[<ffffffff88189c60>] :reiser4:read_unix_file+0x940/0xa10
>[<ffffffff80276bbb>] vfs_read+0xdb/0x180
>[<ffffffff80277083>] sys_read+0x53/0x90
>[<ffffffff8020993e>] system_call+0x7e/0x83
>  
>

Thanks!
Indeed, the coords are not synchronized when reading tails. However,
it is not a fatal bug: we are victims of brain damaged and unreadable
hint interface.

The possible fix is attached. Would you please test it?
Also don't forget to apply this patch: 
http://lkml.org/lkml/diff/2007/7/11/396/1
as it also can be related to the problem.

Edward.

>As for reproducing it, I think I should mention that:
>
>1. I'm using distcc to speed things up. Without offloading the compiling
>work, my laptop has lasted ~3.5hrs before a panic. My desktop with
>distcc configured usually only lasts a few minutes.
>
>2. My local storage is encrypted through dm-crypt, but I've also tried
>over open-iscsi and got the same results.
>
>  
>
>>>>Running fsck.reiser4 before and after the panic doesn't show any complaints.
>>>>The partition is heavily used. I'm not aware of any other problem.
>>>>
>>>>Vanilla-2.6.21.6 (kernel.org) with reiser4-2.6.21-path (namesys.com).
>>>>
>>>>Not that I understood the code, but why is it an assertion at all?
>>>>Couldn't one just use an empty hint if the current one is invalid?
>>>>   
>>>>
>>>>        
>>>>
>>Sure, it is possible to not use it at all. But if the current one is valid,
>>it would be nice to use it to avoid tree traversal with waiting for 
>>possible locks, etc..
>>
>>Thanks,
>>Edward.
>>
>>    
>>


--------------040309090808030404090005
Content-Type: text/x-patch;
 name="reiser4-fix-read_tail.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-fix-read_tail.patch"

Update hint when reading tails

Signed-off-by: Edward Shishkin <edward@namesys.com>
--- linux-2.6.22-rc6-mm1/fs/reiser4/plugin/item/tail.c.orig
+++ linux-2.6.22-rc6-mm1/fs/reiser4/plugin/item/tail.c
@@ -758,7 +758,7 @@
 		coord->unit_pos--;
 		coord->between = AFTER_UNIT;
 	}
-
+	reiser4_set_hint(hint, &f->key, ZNODE_READ_LOCK);
 	return 0;
 }
 

--------------040309090808030404090005--
