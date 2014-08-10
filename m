From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4: discard support with delayed issuing of discard requests
Date: Sun, 10 Aug 2014 22:17:38 +0200
Message-ID: <53E7D362.2090502@gmail.com>
References: <53E6A7F1.6030006@gmail.com> <20140810190210.033a96da@Ulf.tvoe.tv> <3DCC0775ECF24DEFA5A598C0BACABA2E@DuSTmanPC>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=tz5YHBh3blvk9SJuWtAnv+A1cfeuMZVa96UMN9TaQAg=;
        b=DEbJzMS+dFzebUY8ZBqFdzPcRO/s5DGDbybGn+GwGZrnCqJDkfD4ZJeWGey0FTErQA
         ah2mB//fu97vc3UhzvCLQ7Ysc/bSCOM1k1/a1AVceZ0fQD4XPOLuMRkxjn4J/kK2M5Lg
         XiZ/1eaFU/4Kh7Hr+Hm0xO88cRpxEeOeWcatrCqr9QBSDnAhSPy73y6Do11fEbsA/FeC
         50/y99jgPt8SnwjLeODWPw7Ds1eNyBo3tsVqV7EqdNcc31C4a9dZbMQKolKFf20Kg3q1
         eiPW98ZzO2QcL2KcGDQ67vLHPP8BgFfzrkp9usi3+KHv8FsC2m0VWFX9LOL6IwTEC0hc
         KRYw==
In-Reply-To: <3DCC0775ECF24DEFA5A598C0BACABA2E@DuSTmanPC>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Horne <daniel.horne@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>


On 08/10/2014 05:38 PM, Daniel Horne wrote:
> If memory serves, VMware and virtualbox also use TRIM to help reclaim 
> space on the virtual disk files.


Poor virtualization folks... ;)


>
> -- 
> DH
>
>
> ----- Original Message ----- From: "dimas" <dimas000@ya.ru>
> To: "reiserfs-devel" <reiserfs-devel@vger.kernel.org>
> Sent: Sunday, August 10, 2014 4:02 PM
> Subject: Re: Reiser4: discard support with delayed issuing of discard 
> requests
>
>
>> thanks a lot for your explanations!
>> does it all make any sense for non-ssd?
>> will 3.16 contain this all-in-one, without extra patches to find 
>> somewhere else?
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe 
>> reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe 
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

