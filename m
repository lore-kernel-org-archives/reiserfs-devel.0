From: Hans Reiser <reiser@namesys.com>
Subject: Re: Results of "bk clone" tests with 2.6.2,  reiser4, reiserfs,	ext3,
 xfs and jfs
Date: Wed, 11 Feb 2004 15:09:38 -0800
Message-ID: <402AB632.9080006@namesys.com>
References: <1076456354.1585.36.camel@spc.esa.lanl.gov>	 <402A5468.3000609@namesys.com>  <200402110232.54727.elenstev@mesatop.com> <1076525319.1683.44.camel@spc.esa.lanl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16769-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1076525319.1683.44.camel@spc.esa.lanl.gov>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steven Cole <elenstev@mesatop.com>
Cc: reiserfs-list@namesys.com, nikita@namesys.com

Steven Cole wrote:

>On Wed, 2004-02-11 at 02:32, Steven Cole wrote:
>  
>
>>On Wednesday 11 February 2004 09:12 am, Hans Reiser wrote:
>>    
>>
>>>Steven Cole wrote:
>>>      
>>>
>>>>I used the "-o key=key_short" option when creating the
>>>>reiser4 file system due to getting this message:
>>>>"kernel: WARNING: Key format mismatch. Only small keys are supported."
>>>>        
>>>>
>>>This might have hurt our performance substantially.  Did you
>>>intentionally choose small keys?  If not, Nikita, why did this happen?
>>>      
>>>
>>Well, intentionally _only_ because it seemed the reasonable thing to do
>>in the face of the above warning message.  Tomorrow, I can recompile
>>the reiser4-enabled kernel with the large keys option and mkfs.reiser4
>>again without that key_short option.  I'll let you know if there are any interesting
>>results.
>>
>>Steven
>>    
>>
>
>OK, tomorrow came a day early this week.
>
>I recompiled the 2.6.2 reiser4 kernel with CONFIG_REISER4_LARGE_KEY=y,
>rebooted, and created a reiser4 fs without the key_small option as before.
>
>I repeated the tests using the same bk tree and got very similar results
>to using short keys.
>  
>
Hmmm, we need to look into that.  Thanks Steven.  Zam, please analyze 
just what fs operations this benchmark performs, report it, and then 
analyze why we are slow.

>After that, I umounted and did a fsck.reiser4 and got many errors,
>"12463 fixable corrections". 
>
Well it seems you found a reason for us to delay our release.  Nikita 
will go fix it and then get back to you.
