From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: Re: [PATCH 8/8 v2]tuners:tuner-simple Fix warning: variable 'tun'
 set but not used
Date: Mon, 21 Jun 2010 09:14:10 -0700
Message-ID: <4C1F8FD2.6090809@gmail.com>
References: <1276580914-21883-1-git-send-email-justinmattock@gmail.com> <20100621093436.376b819a@pedra>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=YbMydr8FDytBDhQtAPot6+/FPqe7I6FJvFHjGyJbQGw=;
        b=musobLVMNB41zHogPXZl0ijaw6s36Z2GLh8aNJp7vAEBdtDYEZwPx9zgTp4OFl4nUV
         iqpcJDvJoC5WBtVuU2Gk8zwwFKvZz4Quk+wJigVFBc69wY6oe0NqDiXph/cxp0v0bTNd
         BnfeJMrTp6k+GWOkpxtb4nwtbBced7G/R19iA=
In-Reply-To: <20100621093436.376b819a@pedra>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org

On 06/21/2010 05:34 AM, Mauro Carvalho Chehab wrote:
> Em Mon, 14 Jun 2010 22:48:34 -0700
> "Justin P. Mattock"<justinmattock@gmail.com>  escreveu:
>
>> Resend due to a whitespace issue I created by mistake.
>> The below patch fixes a warning message create by gcc 4.6.0
>
> It seems OK for me, but you shouldn't be sending it to be applied at reiserfs-devel ML.
> Instead, it should be sent to linux-media ML, and applied via my tree.
>

I should of used get_maintainer.pl to find the correct list to send this 
too(instead I just looked into the MAINTAINERS file).
I'll resend.

>>
>>   CC [M]  drivers/media/common/tuners/tuner-simple.o
>> drivers/media/common/tuners/tuner-simple.c: In function 'simple_set_tv_freq':
>> drivers/media/common/tuners/tuner-simple.c:548:20: warning: variable 'tun' set but not used
>>
>>   Signed-off-by: Justin P. Mattock<justinmattock@gmail.com>
>>   Reviewed-By: Mauro Carvalho Chehab<mchehab@redhat.com>
>>
>> ---
>>   drivers/media/common/tuners/tuner-simple.c |    3 ---
>>   1 files changed, 0 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/common/tuners/tuner-simple.c b/drivers/media/common/tuners/tuner-simple.c
>> index 8abbcc5..84900fa 100644
>> --- a/drivers/media/common/tuners/tuner-simple.c
>> +++ b/drivers/media/common/tuners/tuner-simple.c
>> @@ -545,14 +545,11 @@ static int simple_set_tv_freq(struct dvb_frontend *fe,
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
>>   	/* IFPCoff = Video Intermediate Frequency - Vif:
>>   		940  =16*58.75  NTSC/J (Japan)
>>   		732  =16*45.75  M/N STD
>
>

Justin P. Mattock
