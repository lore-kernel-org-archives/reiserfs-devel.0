From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: Re: [PATCH 8/8]tuners:tuner-simple Fix warning: variable 'tun' set
 but not used
Date: Mon, 14 Jun 2010 22:50:02 -0700
Message-ID: <4C17148A.508@gmail.com>
References: <1276547208-26569-1-git-send-email-justinmattock@gmail.com> <1276547208-26569-9-git-send-email-justinmattock@gmail.com> <4C170CA4.2020805@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=ivF0OJJdGNcbYyPsUPLgl/wtaFuxKyoVxQ6IW30irXY=;
        b=hwOgYngjEAIG0VCOxfUtmDQS6C/ADjAoPmPxdSjYere95Z2T/Gxj4W64qv2HS60601
         jiGvjJZUageZo0wKmKhV9Fygm+Ob3LhmEN2tQZXogZubxKOaLQQAylsn2e914c6B6s5P
         b70wTmTj10qA+443TfxDOQcKru0nrCN+7k7EE=
In-Reply-To: <4C170CA4.2020805@redhat.com>
Sender: linux-media-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-bluetooth@vger.kernel.org, clemens@ladisch.de, debora@linux.vnet.ibm.com, dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-media@vger.kernel.org

On 06/14/2010 10:16 PM, Mauro Carvalho Chehab wrote:
>
>
> Em 14-06-2010 23:26, Justin P. Mattock escreveu:
>> not sure if this is correct or not for
>> fixing this warning:
>>    CC [M]  drivers/media/common/tuners/tuner-simple.o
>> drivers/media/common/tuners/tuner-simple.c: In function 'simple_set_tv_freq':
>> drivers/media/common/tuners/tuner-simple.c:548:20: warning: variable 'tun' set but not used
>>
>>   Signed-off-by: Justin P. Mattock<justinmattock@gmail.com>
>>
>> ---
>>   drivers/media/common/tuners/tuner-simple.c |    4 +---
>>   1 files changed, 1 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/common/tuners/tuner-simple.c b/drivers/media/common/tuners/tuner-simple.c
>> index 8abbcc5..4465b99 100644
>> --- a/drivers/media/common/tuners/tuner-simple.c
>> +++ b/drivers/media/common/tuners/tuner-simple.c
>> @@ -545,14 +545,12 @@ static int simple_set_tv_freq(struct dvb_frontend *fe,
>>   	struct tuner_simple_priv *priv = fe->tuner_priv;
>>   	u8 config, cb;
>>   	u16 div;
>> -	struct tunertype *tun;
>>   	u8 buffer[4];
>>   	int rc, IFPCoff, i;
>>   	enum param_type desired_type;
>>   	struct tuner_params *t_params;
>>
>> -	tun = priv->tun;
>> -
>> +	
> Why are you adding an extra blank line here? Except for that, the patch
> looks sane.
>
>>   	/* IFPCoff = Video Intermediate Frequency - Vif:
>>   		940  =16*58.75  NTSC/J (Japan)
>>   		732  =16*45.75  M/N STD
>
>

o.k. resent this.. I ended up doing
a git reset do make sure things dont get
funky etc..

Justin P. Mattock
