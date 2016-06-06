From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: + reiserfs-avoid-uninitialized-variable-use.patch added to -mm
 tree
Date: Mon, 6 Jun 2016 13:22:46 -0400
Message-ID: <1e98fa8a-b40a-b259-1032-a3e571eb84e1@suse.com>
References: <5748aeb6.fN9D/KJvuQPxmFHi%akpm@linux-foundation.org>
 <20160530071757.GA3690@quack2.suse.cz> <5731468.VTTDqzParZ@wuerfel>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5731468.VTTDqzParZ@wuerfel>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>, Jan Kara <jack@suse.cz>
Cc: akpm@linux-foundation.org, viro@zeniv.linux.org.uk, reiserfs-devel@vger.kernel.org

On 5/30/16 4:11 AM, Arnd Bergmann wrote:
> On Monday, May 30, 2016 9:17:57 AM CEST Jan Kara wrote:
>> On Fri 27-05-16 13:31:50, Andrew Morton wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>> Subject: reiserfs: avoid uninitialized variable use
>>>
>>> I got this warning on an ARM64 allmodconfig build with gcc-5.3:
>>>
>>> fs/reiserfs/ibalance.c: In function 'balance_internal':
>>> fs/reiserfs/ibalance.c:1158:3: error: 'new_insert_key' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>    memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);
>>>
>>> The warning is correct, in fact both new_insert_key and new_insert_ptr are
>>> only updated inside of an if() block, but used at the end of the function.
>>>
>>> Looking at how the balance_internal() function gets called, it is clear
>>> that this is harmless because the caller never uses the updated arrays,
>>> they are initialized from balance_leaf_new_nodes() and then passed into
>>> balance_internal().
>>>
>>> This has not changed at all since the start of the git history, but
>>> apparently the warning has only recently appeared.
>>>
>>> This modifies the function to only update the two argument variables when
>>> the new_insert_key and new_insert_ptr have been updated, to get rid of the
>>> warning.
>>>
>>> Link: http://lkml.kernel.org/r/1464380569-3493380-1-git-send-email-arnd@arndb.de
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
>>> Cc: Jan Kara <jack@suse.cz>
>>> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>>> ---
>>>
>>>  fs/reiserfs/ibalance.c |    6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff -puN fs/reiserfs/ibalance.c~reiserfs-avoid-uninitialized-variable-use fs/reiserfs/ibalance.c
>>> --- a/fs/reiserfs/ibalance.c~reiserfs-avoid-uninitialized-variable-use
>>> +++ a/fs/reiserfs/ibalance.c
>>> @@ -1138,6 +1138,9 @@ int balance_internal(struct tree_balance
>>>                      S_new);
>>>  
>>>               /* S_new is released in unfix_nodes */
>>> +
>>> +             memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);
>>> +             insert_ptr[0] = new_insert_ptr;
>>>       }
>>>  
>>>       n = B_NR_ITEMS(tbSh);   /*number of items in S[h] */
>>> @@ -1153,8 +1156,5 @@ int balance_internal(struct tree_balance
>>>                                      insert_ptr);
>>>       }
>>>  
>>> -     memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);
>>> -     insert_ptr[0] = new_insert_ptr;
>>> -
>>>       return order;
>>>  }
>>
>> Looking at the patch now, I think it is buggy. The insert_ptr is used as an
>> argument to internal_insert_childs() and this patch ends up overwriting the
>> original value before the last call to that function... Not that I would
>> really understand what the code is trying to do (CCed Jeff who may have
>> better idea), this is based purely on syntactical analysis ;).
>>
> 
> You are right, I missed that. I spent a significant amount of time following
> those variables around in the code to see how they are used (most functions
> that take them as arguments only pass them to the next function and eventually
> don't acces them at all), but I missed that final use.

Yeah, the reiserfs tree code is pretty horrible.  I spent most of the time while
I was working on reiserfs avoiding it.  It "just worked" and I didn't want to
mess with it other than to dissect balance_leaf.

> Maybe we can just drop the two assignments instead of moving them?

No, the assignments can't be dropped.  That would end up breaking the balancing
code by not inserting internal items in the next higher level of the tree to
point to the new blocks created.  What we can do is just protect it via an if
statement.  Gcc knows how to handle that properly.  I'll reply with a patch
you can use with git-am.

-Jeff

-- 
Jeff Mahoney
SUSE Labs
