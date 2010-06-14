From: "Justin P. Mattock" <justinmattock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/8]reiserfs:stree.c Fix variable set but not used.
Date: Mon, 14 Jun 2010 14:09:58 -0700
Message-ID: <4C169AA6.6030809@gmail.com>
References: <1276547208-26569-1-git-send-email-justinmattock@gmail.com> <1276547208-26569-2-git-send-email-justinmattock@gmail.com> <20100614204805.GA12589@elliptictech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=Jy191QKSy0rQ4n5BCOJTWqT9wG3+5mntIVQ9vEKfmps=;
        b=RhBHUs2W5zfLV3f13of1TnTncGXHnwATZXf9pfXVOpsy9zQR+2u/gYs25QRWEDUZG0
         G3e9RszyI7Ih+wtC9LB+K2SKj5mwBhsrC/onjcn3I7HnjUEAiK/P70uQLya0v0jPSFgD
         St8JDhPTCBJN/Q1KL7N9642nZNhZXTPmcbuuY=
In-Reply-To: <20100614204805.GA12589-7BP4RkwGw0uXmMXjJBpWqg@public.gmane.org>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, reiserfs-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, clemens-P6GI/4k7KOmELgA04lAiVw@public.gmane.org, debora-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-i2

On 06/14/2010 01:48 PM, Nick Bowler wrote:
> On 13:26 Mon 14 Jun     , Justin P. Mattock wrote:
>> @@ -617,8 +616,7 @@ int search_by_key(struct super_block *sb, const struct cpu_key *key,	/* Key to s
>>
>>   	pathrelse(search_path);
>>
>> -	right_neighbor_of_leaf_node = 0;
>> -
>> +	
>
> This hunk introduces whitespace on the empty line, which is not cool.

I can resend!!(biggest problem is working
through these warnings)

>
>>   	/* With each iteration of this loop we search through the items in the
>>   	   current node, and calculate the next current node(next path element)
>>   	   for the next iteration of this loop.. */
>> @@ -695,8 +693,7 @@ int search_by_key(struct super_block *sb, const struct cpu_key *key,	/* Key to s
>>   			   starting from the root. */
>>   			block_number = SB_ROOT_BLOCK(sb);
>>   			expected_level = -1;
>> -			right_neighbor_of_leaf_node = 0;
>> -
>> +			
>
> Here, too.
>
> Most of the patches in this series have similar issues.
>

main thing now(for me atleast)is,
is this actual dead code or what?
if not then something else needs to
be done, if yes then I guess I can
resend this, with out the whitespace
issue.

Justin P. Mattock
