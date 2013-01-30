From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 panics on kernel 3.6.11 (balance_dirty_page_cluster,
 edward-1547)
Date: Wed, 30 Jan 2013 21:27:34 +0100
Message-ID: <51098236.3000003@gmail.com>
References: <5103A388.2080906@gmail.com> <5105BD24.1020009@gmail.com> <51096AFC.10400@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=LymgOzm/fI7IFVdqsmbQfqOTAkbBx6yO5T+MSCRpjkE=;
        b=0B1pcCB1ZJPbsYC/8ZorTEqrqobJlH7wiVc/hmG5x89E7hcIuo/0qP1wiYxNPlUsXz
         c7aIEf9nuQ+MjHnQMD6jkkF8mX82znhPIPPlnbZh51rosdCfAd4hkV7MMcl7HwkhZkAJ
         uql9lSNHKriNVTG/aTIiS52AymyFXGt7zMaSRSLuLJt1GBD7IExb0f1Ta8JEg5Ch6Cpw
         9opKmca/ebUbDRReotzPAOnvU7m6OGTUtZcTnUFrCJBEq6ElLTi/shx0X4U1h0RDpgKz
         JV+3M3cMD0Bb9fTFBWMumlU+6siepC85EsQO2/f8uQKUCEpu2ZQz6Pd6CV/+ZEs1X4NO
         0/Iw==
In-Reply-To: <51096AFC.10400@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gleb Baryshev <gleb.baryshev@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 01/30/2013 07:48 PM, Gleb Baryshev wrote:
> 28.01.2013 00:49, Edward Shishkin wrote:
>> Hello Gleb,
>>
>> Thanks for the report!
>> Please, find the fixup in the attachment.
>>
>> Edward.
>> P.S. Reiser4 debug mode results in dramatic performance drop
>> when tail packing / compression is on. Use it only when something
>> goes wrong...
>
> Now it works ok, thank you for the fix and for the hint!
>

You are welcome.
Also if you work with reiser4 on kernels < 3.7, please,
make sure that the following options in .config are off:

CONFIG_HUGEPAGES
CONFIG_COMPACTION
CONFIG_MIGRATION

Thanks,
Edward.
