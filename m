From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Problems with the 'flush-8:0' process in 2.6.35.3
Date: Tue, 31 Aug 2010 02:21:16 +0200
Message-ID: <4C7C4AFC.2040009@gmail.com>
References: <4C789044.3020403@podzimek.org> <4C78E1D5.80101@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=CTrMrbsEQ+jJWJ+7ycjb1eiHjl2DY4ldGZZFTelVLAk=;
        b=OE4cPLakOK82NEp0znHAmUKOL1pUuYERuDRYiNUQW9FlhV6FlhJZZ9xMq3axkpEINZ
         48Z6/Nt+QkSkOVG2nxNf07T3n/4wi/nThQF9Bo/ksUKGgTOJF8lnUJf9yLw9LLeDEgZh
         9qxSKLvmz2oyg3Jby4IwZgyADT3cY8allUuH0=
In-Reply-To: <4C78E1D5.80101@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrej Podzimek <andrej@podzimek.org>
Cc: reiserfs-devel@vger.kernel.org

Edward Shishkin wrote:
> Andrej Podzimek wrote:
>   
>> Hello,
>>     
>
> Hello.
>
>   
>> I use a 2.6.35.3 kernel and Reiser4 as the root file system. In a
>> couple of minutes after boot, a kernel process called 'flush-8:0'
>> takes up all the available CPU time. From that moment on, it is
>> impossible to sync filesystems (and suspend, hibernate or reboot).
>> (The 'sync' command halts indefinitely.) In some cases it is even
>> impossible to log in. Existing sessions seem to work fine, to an extent.
>>
>> I first thought this was related to the GTT chipset coherency patch.
>> (This patch fixes a one-year-old bug that caused all the Intel 855
>> class GPUs to be totally unusable.) However, removing the patch and
>> testing with only a vanilla kernel (and Reiser4, of course) showed
>> that 'flush-8:0' will eventually go mad, no matter if the GPU-related
>> patch is present or not.
>>
>> The machine is an Asus M2400N laptop with a 100GB Seagate Momentus.
>>
>> Is this a known issue?
>>     
>
> Um, nop..
>
>   
>> How could I track this down?
>>     
>
> Could you try to catch sysrq-t output to take a look what the flush-8:0
> doing?
>   

Any progress here?
Also could you please check your partition with fsck?

Thanks,
Edward.

>   
>> In fact I don't even know whether this is related to Reiser4 or not.
>>     
>
> Which kernel version did you have before upgrade?
>
> Thanks,
> Edward.
>
>   
>> It may be a bug in VFS. I don't use 'noflushd' or anything of that
>> kind. (Some people reported similar problems related to noflushd. So
>> this is not the case.) If this is unrelated to Reiser4, where should I
>> report it?
>>
>> Andrej
>>
>>     
>
>
>   

