From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH 051/141] reiserfs: Fix fall-through warnings for Clang
Date: Mon, 17 May 2021 19:03:07 -0500
Message-ID: <cb6bd498-9864-c884-f844-838796443531@embeddedor.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <6859fecccd96f79612f9650fdba7a66bbff70560.1605896059.git.gustavoars@kernel.org>
 <7229aa6e-9943-9568-faf2-7c8cd81e6890@embeddedor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:To:From:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rGr6+qMMJocwMXuMLsw5MiXm4TZdt9GYUPCcl+Bo3Sg=; b=YZr3b7rSqOBpWX0yMK9DXiPpGQ
        3E+JvH/qrCKrT8hJGrxJhIfU96peRVHG3ZK8avDiXVXy0XnhBS4QoYS0xy4dZDKDa23PMy8uVBijP
        XqdcS8FgAGh38r7xsD/aRym4Jehq0pDqi7efLTxWXM/AJNdNjZvV75xo5syxaxiXp8tZ22zkW5zdh
        qrtad2cw2EODRM1kse5M3wpCMm1A2wk8hB2y/yzFPdeHnNIP+MwUPsBh94Oi/dYI24zHm1z3vKrX0
        gnxE2lrYkuU7wACMbkfESxItjHeXGdIzYt3ITV8lT4xgnlNh3zYUu2HXeW05NA1fKjbPn9Ux9IAqx
        BmXJ 
In-Reply-To: <7229aa6e-9943-9568-faf2-7c8cd81e6890@embeddedor.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Hi,

I'm taking this in my -next[1] branch for v5.14.

Thanks
--
Gustavo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/log/?h=for-next/kspp

On 4/20/21 15:23, Gustavo A. R. Silva wrote:
> Hi all,
> 
> Friendly ping: who can take this, please?
> 
> Thanks
> --
> Gustavo
> 
> On 11/20/20 12:32, Gustavo A. R. Silva wrote:
>> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
>> by explicitly adding a break statement instead of letting the code fall
>> through to the next case.
>>
>> Link: https://github.com/KSPP/linux/issues/115
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>  fs/reiserfs/namei.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
>> index 1594687582f0..90bb49bfdba0 100644
>> --- a/fs/reiserfs/namei.c
>> +++ b/fs/reiserfs/namei.c
>> @@ -132,6 +132,7 @@ int search_by_entry_key(struct super_block *sb, const struct cpu_key *key,
>>  			return IO_ERROR;
>>  		}
>>  		PATH_LAST_POSITION(path)--;
>> +		break;
>>  
>>  	case ITEM_FOUND:
>>  		break;
>>
