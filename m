From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Which patches can be applied on top of reiser4-for-3.15.1.patch.gz
Date: Mon, 25 Aug 2014 13:35:52 +0200
Message-ID: <53FB1F98.7080705@gmail.com>
References: <f6e6b313d9543ba6a1ad9a5707637dc8@mail.velocitynet.com.au> <14374339.ZjIIAzvjXL@intelfx-laptop> <ddb1dce22777b95f061191f777a1d349@mail.velocitynet.com.au> <2478269.HnJ0o2pqqt@intelfx-laptop> <f7ff33e2237d6f316d2f8812e44e4419@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=6b7YGqb9k9cXn7s7H+Jzq6YANZaXQU1TFgyUsk+9Jc8=;
        b=eOpyoWH2d174zzYJMCHbaXD56NZ/CgrKXcsSD7Tn9ej69FpfiyMTDOWX8WThtuJ4LD
         w+eDX3l6hLYUPjnhCd7rvqlczsT5eS/Yz1RM4XkJOASXwFKCdyU0pJdO0piXKcBbi4CC
         TAtC5I8xspHiLtTrw08xtgPugyUHKCz28F8E9Bzw9AbWPv+ZWKCoMOx1Hsl1lvh5G8iy
         A6J+V2sIogQWUlmYoTHycHEtT/Kal2lRXaglkpGgqX+49VHBwgKdbLL7Q5wAxLfqFK+i
         Ci7iD6Md90z8BN3uniPcChr9rFOuLTt7ykNB7v0fcsTjLh67w+TSh6ANLsK3PCGyLWau
         lYZw==
In-Reply-To: <f7ff33e2237d6f316d2f8812e44e4419@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

On 08/25/2014 12:53 PM, doiggl@velocitynet.com.au wrote:
> On Mon, 25 Aug 2014 02:57:29 +0400, Ivan Shapovalov <intelfx100@gmail.com>
> wrote:
>> On Sunday 24 August 2014 at 18:09:13, doiggl@velocitynet.com.au wrote:	
>>> [...]
>>>
>>> Hello,
>>> Thanks for the details.
>>>
>>> rpms did build with following patches applied:
>>>          reiser4-for-3.15.1.patch
>>>          3.15.1-reiser4-basic-discard-support.patch
>>>
>>> see link to built rpms url [with above patches applied]
>>>
> https://build.opensuse.org/package/binaries/home:doiggl/kernel-reiser4?repository=openSUSE_13.1
>>> Question:
>>> Which "in-flight" patchsets can be applied on top of discard support
>>> patch
>>> ?
>>> Url link to patch appreciated.
>> Why do you ask? Do you want to build a general-purpose kernel with these
>> patches
>> or just help with testing?
>> Anyway,
>>
>> this is a last bugfix patch from Edward (on top of 3.15):
>>
>> - [patch 1/1] reiser4: implement ->remount_fs() super operation
>> http://www.spinics.net/lists/reiserfs-devel/msg04193.html
>>
>> and these are three patchsets that can be applied but are _unreviewed_
>> (on top of 3.15 + basic discard support):
>>
>> - [RFC] [PATCHv3 0/9] reiser4: batch discard support (FITRIM ioctl):
>> initial implementation.
>> http://www.spinics.net/lists/reiserfs-devel/msg04166.html
>>
>> - [PATCH 0/2] reiser4: block deallocation fixes.
>> http://www.spinics.net/lists/reiserfs-devel/msg04177.html
>>
>> - [PATCH 0/3] reiser4: space grabbing fixes.
>> http://www.spinics.net/lists/reiserfs-devel/msg04180.html
>>
>> Hope that helps,
> Hello,
>
> RE:Why do you ask? Do you want to build a general-purpose kernel with
> these patches or just help with testing?
> Answer: I wanted to access a separate disk with a existing reiser4
> partition on it. But thats another saga-storey.


Then you don't need those patches.
Wait for the new stuff at
https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/
https://sourceforge.net/projects/reiser4/files/patches/

Edward.


>
> Questions:
> - Is the listing below correct ?
> - Are all 9 patches needed to put in place "batch discard support (FITRIM
> ioctl)"
>
> [RFC] [PATCHv3 1/9] reiser4: block_alloc: add BA_SOME_SPACE flag for
> grabbing a fixed amount of space.
> ..
> ..
> [RFC] [PATCHv3 9/9] reiser4: batch discard support: honor minimal extent
> length passed from the userspace.
>
> Details
> -------
>
> - [PATCH 0/2] reiser4: block deallocation fixes.
> http://www.spinics.net/lists/reiserfs-devel/msg04177.html
>
> - [PATCH 0/3] reiser4: space grabbing fixes.
> http://www.spinics.net/lists/reiserfs-devel/msg04180.html
>
> - [RFC] [PATCHv3 0/9] reiser4: batch discard support (FITRIM ioctl):
> initial implementation.
> http://www.spinics.net/lists/reiserfs-devel/msg04166.html
>
> [1]
>
> [2+3+9 =14 patch files to apply] as shown below
> patch urls listing.
>
> block deallocation fixes
> ------------------------
> http://www.spinics.net/lists/reiserfs-devel/msg04177.html
>    reiser4: sanitize deallocations throughout the code.
>    reiser4: block_alloc: get rid of discard-related hack in
> reiser4_dealloc_blocks().
>    
>    [PATCH 1/2] sanitize deallocations throughout the code.
>    [PATCH 2/2] block_alloc: get rid of discard-related hack in
> reiser4_dealloc_blocks()
>
> space grabbing fixes
> --------------------
> http://www.spinics.net/lists/reiserfs-devel/msg04180.html
>    reiser4: block_alloc: improve error handling in reiser4_grab_reserved().
>    reiser4: block_alloc: sanitize grab_enabled modifications.
>    reiser4: do not mess with grab_enabled; instead, use BA_FORCE.
>    
>    [PATCH 1/3] reiser4: block_alloc: improve error handling in
> reiser4_grab_reserved().
>    [PATCH 2/3] reiser4: block_alloc: sanitize grab_enabled modifications.
>    [PATCH 3/3] reiser4: do not mess with grab_enabled; instead, use
> BA_FORCE.
>
> [RFC] [PATCHv3 0/9] reiser4: batch discard support (FITRIM ioctl)
> -----------------------------------------------------------------
>
> [RFC] [PATCHv3 1/9] reiser4: block_alloc: add BA_SOME_SPACE flag for
> grabbing a fixed amount of space.
> [RFC] [PATCHv3 2/9] reiser4: block_alloc: add a "forward" parameter to
> reiser4_blocknr_hint to allocate blocks only in forward direction.
> [RFC] [PATCHv3 3/9] reiser4: txnmgr: free allocated but unneeded atom in
> atom_begin_and_assign_to_txnh().
> [RFC] [PATCHv3 4/9] reiser4: txnmgr: add reiser4_create_atom() which
> creates an empty atom without capturing any nodes.
> [RFC] [PATCHv3 5/9] reiser4: txnmgr: call reiser4_post_write_back_hook()
> also for empty atoms.
> [RFC] [PATCHv3 6/9] reiser4: batch discard support: add a dummy FITRIM
> ioctl handler for directories.
> [RFC] [PATCHv3 7/9] reiser4: batch discard support: actually implement the
> FITRIM ioctl handler.
> [RFC] [PATCHv3 8/9] reiser4: block_alloc: add a "min_len" parameter to
> reiser4_blocknr_hint to limit allocated extent length from below.
> [RFC] [PATCHv3 9/9] reiser4: batch discard support: honor minimal extent
> length passed from the userspace.
>
> http://www.spinics.net/lists/reiserfs-devel/
> msg04167.html
> msg04168.html
> msg04169.html
> msg04171.html
> msg04172.html
> msg04173.html
> msg04174.html
> msg04175.html
>
> Thanks for your help and time.
> Cheers Glenn
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

