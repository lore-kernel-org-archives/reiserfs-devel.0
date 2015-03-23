From: Sanidhya Kashyap <sanidhya.gatech@gmail.com>
Subject: Re: [PATCH] reiserfs: kstrdup() memory handling
Date: Sun, 22 Mar 2015 20:12:46 -0400
Message-ID: <CADa969h6MLbM3vporSjkctBxQwsqphghbXQxAhtyBUeUuqrWQA@mail.gmail.com>
References: <1426957213-5508-1-git-send-email-sanidhya.gatech@gmail.com>
	<20150321171547.GA5663@thin>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=KMiicMbSqhGaM0KaZm3KZr65PFQCW+6oJwvPkKeuqJk=;
        b=AGDGWjw+jPzJReO9q8OqJ54iOeP5v6+v0FUkKHb5SfsfQr9I53OiqjlwKkykdmtEb+
         C4VLc4efkdtOBOXGBeKzqBZRTfFvcQejAyE8E7dMpTA+DPMIRP48FCWQqlGKWEfid0Yr
         BnYE96YtaqVpD9tV4MYmn5HPXvgcj///GUuIOls5P5LjWGLzyTAEQHzQvgLQuqf1JBnf
         EfxMPr45KeRs2b6/6smfUfOw053HzhNLCa/jO6YOtjSGuHLryK2qtp8qnma9+7zevr7U
         iY3vT0O0rsR2WcQ4IaNqgJGxCQAbkL8wEKfWZb0Z6NgSzQSlAHDUOlo/zigLRAfda0Xl
         mLxg==
In-Reply-To: <20150321171547.GA5663@thin>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josh Triplett <josh@joshtriplett.org>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, "Kashyap, Sanidhya" <sanidhya@gatech.edu>

On Sat, Mar 21, 2015 at 1:15 PM, Josh Triplett <josh@joshtriplett.org> wrote:
> On Sat, Mar 21, 2015 at 01:00:13PM -0400, Sanidhya Kashyap wrote:
>> Checking for ENOMEM even for new_opts in reiserfs_remount function as
>> there is a possibility of nothing being allocated.
>
> You don't need to add a new label; kfree(NULL) is a no-op.
>

Shall I resubmit the patch?

Thanks,
Sanidhya

>> Signed-off-by: Sanidhya Kashyap <sanidhya.gatech@gmail.com>
>> ---
>>  fs/reiserfs/super.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
>> index 71fbbe3..bf9bc66 100644
>> --- a/fs/reiserfs/super.c
>> +++ b/fs/reiserfs/super.c
>> @@ -1397,6 +1397,11 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
>>       int i;
>>  #endif
>>
>> +     if (!new_opts) {
>> +             err = -ENOMEM;
>> +             goto out_err_no_kfree;
>> +     }
>> +
>>       sync_filesystem(s);
>>       reiserfs_write_lock(s);
>>
>> @@ -1549,6 +1554,7 @@ out_err_unlock:
>>       reiserfs_write_unlock(s);
>>  out_err:
>>       kfree(new_opts);
>> +out_err_no_kfree:
>>       return err;
>>  }
>>
>> --
>> 2.1.0
>>
