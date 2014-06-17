From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Tue, 17 Jun 2014 12:29:53 +0200
Message-ID: <53A018A1.5030403@gmail.com>
References: <3401431.jj87z7i0xD@intelfx-laptop> <3381547.FkGuFJAHk4@intelfx-laptop> <539F8DBC.4010000@gmail.com> <2537417.F0W18VYPYg@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=+zq3f1wJ6YyOseqKIrROYMcyNFglCdkgGhpMdSlEVCY=;
        b=rZq5qGKw+6gCs+VxRgU+uSPxn7a/miLTBMwN6YE/DxQMwEkeeL+8LfQwM9lWbmp37n
         xjtDfplNnImCI1Ml1+lFMIrSG3G3emRsCIGMNIqUfTNq+mwoIuJWixOGeGikJUHDVsOe
         IN7Wb/z6YN1HPkttzDjDP+ltGna+aDX45civmioYZFzXSqCpAb4mNGPw7LTc+pwSiw+C
         4p7jWEqtKGbZnrBKEZ9TZIltmyeOQmVEisI3JHKjGQHRf0IzouIySP2rdY1I9VmQalmf
         WilHxjgi6ux11XFyao3Etse5if+gBHihgc8JPqZK+UN/IVHRJDstRfvwrMvolyvfvsps
         g5oA==
In-Reply-To: <2537417.F0W18VYPYg@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 06/17/2014 12:14 PM, Ivan Shapovalov wrote:
> On Tuesday 17 June 2014 at 02:37:16, Edward Shishkin wrote:	
>> [...]
>>
>> Yup, blocknr sets minimize memory consumption and are unsortable...
>>
>> I think that the cleanest option will be using lists (instead of blocknr
>> sets) for
>> the delete sets, if the discard is turned on. It will reduce memory
>> consumption
>> by 20%. Indeed, every entry in a blocknr_set occupies ~8 bytes (assuming
>> that everything is pretty fragmented because of txmod=wa), whereas a list
>> entry occupies 32 bytes (start, length, plus 2 pointers for the link).
>>
>> In this option we'll need to join lists (instead of merging blocknr
>> sets) during
>> atoms fusion and apply the list (instead of blocknr set) to the COMMIT
>> BITMAP
>> at pre_commit_hook(). I think it won't be a problem, since the lists are
>> simpler
>> than blocknr sets.
> That's a neat approach. I think I'll use unions and do the decision at runtime.


Yup.
So, if discard is on, we work with 2 lists (delete_set, 
delete_set_for_wander).
If discard is off, we work with one blocknr set..
