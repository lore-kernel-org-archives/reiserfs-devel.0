From: Hans Reiser <reiser@namesys.com>
Subject: Re: filenames that can be safely stolen (was Re: starting with ".."
 could break stuff)
Date: Sat, 03 Apr 2004 10:05:22 -0800
Message-ID: <406EFCE2.8000108@namesys.com>
References: <200404010546.i315kEvY019805@sirius.cs.pdx.edu> <20040402035617.GC2158@zero> <8765ciqr6v.fsf@uhoreg.ca> <20040402220250.GB4668@rahul.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17680-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040402220250.GB4668@rahul.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bennett Todd <bet@rahul.net>
Cc: reiserfs-list@namesys.com

Bennett Todd wrote:

>2004-04-02T16:29:12 Hubert Chan:
>  
>
>>Tom> i bet there's a few apps that, when trying to skip .., only check
>>Tom> the first two chars of the name. this may or may not be a problem.
>>
>>Then those apps are broken.  ..foo has always been a valid filename
>>(though highly uncommon).  ..metas doesn't introduce anything new -- it
>>only makes ..files more common.
>>    
>>
>
>Yup.
>
>For another example, AFS steals "@sys"; it's a special black-magic
>voodoo name that acts like a symlink to a machine-specific value,
>used to set up baroque symlink trees so one uniform network
>filesystem can support dispatching to appropriate versions of
>machine-specific files like executables.
>
>So another possibility worth considering might be @metas, with the
>prior art of AFS to cite to people who complain about theoretical
>problems:-).
>
>-Bennett
>  
>
i care more about people 20 years from now complaining that reiserfs is 
ugly in its aesthetics than about unreal problems.

punctuation in method names is uglier than "metas"

-- 
Hans


