From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: SOLVED! Re: Issues with reiser4 patch for Linux 4.12.0.
Date: Fri, 18 Aug 2017 11:13:02 +0200
Message-ID: <4b456c74-f647-0252-01a5-01c532eb8d11@gmail.com>
References: <20170818053540.C4688C8D972@mictlantecuhtli.metztli-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=Mwf1NIewW9DK87pyr62VVkAdl9gfhqI4/z2j4dPXj4Y=;
        b=g8vlWJFsCMMuYK+9x8LJ9jIkwSlE8vpd8ljlaqinwTOMXd8B86aGp/xgZtMN7G7ug8
         5CL8mBphRIhV85rSmU8pOukcCvh1tWA9IpIC4f11TIVWzDPyzsM506ULQyxhO7Ser3yv
         6BmELuatv5XlH+fz82DhE9TK/QJUvvDhyXIjsPW/KZxbN8JK4RJ7Thsx/m4GNmA3uado
         oKz+/v4uK7Mf2eDUzE5LAlFAdStSnsZfKblkfPz7hCqbCiervFbShdlrnuvVEPYi9V82
         AjP/6ATECG87MYLJONcxcin5TC9CzGI1ssc5HbPkviPXCF4kcW091/w8avVGdTRG+Z+/
         ZQKA==
In-Reply-To: <20170818053540.C4688C8D972@mictlantecuhtli.metztli-it.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Resource was used right after its release - a kind of sleeping bug..

Edward.

On 08/18/2017 07:35 AM, Jose R Rodriguez wrote:
> Your included patch worked, Edward. Thank you.
>
>> Hello.
>> Does the attached patch help?
>> Thanks,
>> Edward.
> On 08/17/2017 02:14 AM, Jose R Rodriguez wrote:
>>> Niltze, Ed-
>>>
>>> I have applied your latest patch to Debian Linux kernel and packaging 12.4.6-1, itself patched with upstream differential kernel patch 4.12.6-7.
>>>
>>> After ironing out some Debian kernel maintainer packaging code issues, i.e.,
>>>
>>> Modifying:
>>> debian/rules.d/tools/power/x86/turbostat/Makefile
>>>
>>> and replacing directive:
>>> CPPFLAGS += -DMSRHEADER='<asm/msr-index.h>' -DINTEL_FAMILY_HEADER='"$(top_srcdir)/arch/x86/include/asm/intel-family.h"'
>>>
>>> with
>>> CPPFLAGS += -DMSRHEADER='"$(top_srcdir)/arch/x86/include/asm/msr-index.h"' -DINTEL_FAMILY_HEADER='"$(top_srcdir)/arch/x86/include/asm/intel-family.h"'
>>>
>>> enabled the compiler to complete build procedure where it was failing.
>>>
> []
>
> --------------D029B91EB0C5287A303173DF
> Content-Type: text/x-patch;
>   name="reiser4-done-fs-info-after-exit-ctx.patch"
> Content-Transfer-Encoding: 7bit
> Content-Disposition: attachment;
>   filename="reiser4-done-fs-info-after-exit-ctx.patch"
>
> diff --git a/init_super.c b/init_super.c
> index fb37605..f45e42d 100644
> --- a/init_super.c
> +++ b/init_super.c
> @@ -47,14 +47,10 @@ int reiser4_init_fs_info(struct super_block *super)
>   void reiser4_done_fs_info(struct super_block *super)
>   {
>   	assert("zam-990", super->s_fs_info != NULL);
> -
> -	/* release per-super-block d_cursor resources */
> +	/*
> +	 * release per-super-block d_cursor resources
> +	 */
>   	reiser4_done_super_d_info(super);
> -
> -	/* make sure that there are not jnodes already */
> -	assert("", list_empty(&get_super_private(super)->all_jnodes));
> -	assert("", get_current_context()->trans->atom == NULL);
> -	reiser4_check_block_counters(super);
>   	kfree(super->s_fs_info);
>   	super->s_fs_info = NULL;
>   }
> diff --git a/page_cache.c b/page_cache.c
> index 099c00a..c566bf9 100644
> --- a/page_cache.c
> +++ b/page_cache.c
> @@ -282,19 +282,16 @@ void reiser4_done_formatted_fake(struct super_block *super)
>   	sinfo = get_super_private_nocheck(super);
>   
>   	if (sinfo->fake != NULL) {
> -		inode_detach_wb(sinfo->fake);
>   		iput(sinfo->fake);
>   		sinfo->fake = NULL;
>   	}
>   
>   	if (sinfo->bitmap != NULL) {
> -		inode_detach_wb(sinfo->bitmap);
>   		iput(sinfo->bitmap);
>   		sinfo->bitmap = NULL;
>   	}
>   
>   	if (sinfo->cc != NULL) {
> -		inode_detach_wb(sinfo->cc);
>   		iput(sinfo->cc);
>   		sinfo->cc = NULL;
>   	}
> diff --git a/super_ops.c b/super_ops.c
> --- a/super_ops.c
> index 697580c..2222e86 100644
> +++ b/super_ops.c
> @@ -257,8 +257,12 @@ static void reiser4_put_super(struct super_block *super)
>   	reiser4_done_ktxnmgrd(super);
>   	reiser4_done_txnmgr(&sbinfo->tmgr);
>   
> -	reiser4_done_fs_info(super);
> +	assert("edward-1890", list_empty(&get_super_private(super)->all_jnodes));
> +	assert("edward-1891", get_current_context()->trans->atom == NULL);
> +	reiser4_check_block_counters(super);	
> +
>   	reiser4_exit_context(ctx);
> +	reiser4_done_fs_info(super);
>   }
>   
>   /**
>
> --------------D029B91EB0C5287A303173DF--
> --
>
> Obviously it also solved the sudden crash upon powering down and/or rebooting (hence umounting) this Debian development environment on reiser4 root filesystem, too.
>
> Again, much appreciated Mr. Shishkin!
>
>
> Best Professional Regards.
>

