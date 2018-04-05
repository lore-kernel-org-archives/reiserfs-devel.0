From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH?] reiserfs: prevent panic: don't allow %-char in journal
 dev. name
Date: Wed, 4 Apr 2018 19:05:31 -0700
Message-ID: <e1d9b08a-4510-df2e-9731-4ff157834320@infradead.org>
References: <d9b518a5-287a-72b3-05f1-ea89e25563ba@infradead.org>
 <20180404184517.9f2b91b856a56f71464f5f7f@linux-foundation.org>
 <5e9ea36a-6a6a-921c-81b3-bc623a9e125a@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ByyIjeGJKNmICDTsPuQbR/j39Buu7kp+iUTKk60sszo=; b=Hxco/TmksTsz6nFkcSVRbVDyx
        aU71rILDRYdNhAg5v4uCAixWFCIzkgRDD8Sbtzfuf0Kafepnew34ZXNlIqaPUtbKBe7V/EnFGDQT0
        KVhj5q0bH/ok4T3qhB95fUG++nflZZNNiKmo+fJdhKk2C4HqBBf7FvQMLSTkYricE4uAda6LUAbiJ
        HKxR/jrB15Cj3Jko1FIUHjCot4Q9a6TGSAa35E0Co1xVzrZipLMCZLL23tkAjMsmVrQOs9vYC5/uf
        7gDQI50BCh1RypgC9grz4BZRTozMzeUL/BV2yj01cyN67Uxc4Uv2UhYwxzB70Fb08SIwW/Ce538TQ
    
In-Reply-To: <5e9ea36a-6a6a-921c-81b3-bc623a9e125a@suse.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.com>, Frederic Weisbecker <fweisbec@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>, syzkaller-bugs@googlegroups.com, syzbot+6bd77b88c1977c03f584@syzkaller.appspotmail.com

On 04/04/2018 06:48 PM, Jeff Mahoney wrote:
> On 4/4/18 9:45 PM, Andrew Morton wrote:
>> On Wed, 4 Apr 2018 18:25:16 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>> From: Randy Dunlap <rdunlap@infradead.org>
>>>
>>> If the reiserfs mount option's journal name contains a '%' character,
>>> it can lead to a WARN_ONCE() in lib/vsprintf.c::format_decode(),
>>> saying: "Please remove unsupported %/ in format string."
>>> That's OK until panic_on_warn is set, at which point it's dead, Jim.
>>>
>>> To placate this situation, check the journal name string for a '%'
>>> character and return an error if one is found. Also print a warning
>>> (one that won't panic the kernel) about the invalid journal name (e.g.):
>>>
>>>   reiserfs: journal device name is invalid: %/file0
>>>
>>> (In this example, the caller app specified the journal device name as
>>> "%/file0".)
>>>
>>
>> Well, that is a valid filename and we should support it...
>>
>> Isn't the bug in journal_init_dev()?

OK, thanks.

> Yep.  That's exactly it.
> 
> Acked-by: Jeff Mahoney <jeffm@suse.com>
> 
> Thanks,
> 
> -Jeff
> 
>> --- a/fs/reiserfs/journal.c~a
>> +++ a/fs/reiserfs/journal.c
>> @@ -2643,7 +2643,7 @@ static int journal_init_dev(struct super
>>  	if (IS_ERR(journal->j_dev_bd)) {
>>  		result = PTR_ERR(journal->j_dev_bd);
>>  		journal->j_dev_bd = NULL;
>> -		reiserfs_warning(super,
>> +		reiserfs_warning(super, "sh-457",
>>  				 "journal_init_dev: Cannot open '%s': %i",
>>  				 jdev_name, result);
>>  		return result;
>> _
>>
>>
> 
> 


-- 
~Randy
