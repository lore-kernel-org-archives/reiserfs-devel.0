From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: porting to 3.16: any reason ->aio_read() of struct file_operations
 has been left out?
Date: Thu, 21 Aug 2014 00:30:45 +0200
Message-ID: <53F52195.1020900@gmail.com>
References: <10671542.MCAVDCHSND@intelfx-laptop> <53F3E03E.7030805@gmail.com> <5431496.Ue9YL3Eeu2@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=jn/NgHUXI15Tf36OQSE+qH3Nsk53SjZvYyJyZj+RTl4=;
        b=fmjVG3eF50WnAWFrzwR8V9GSqU3+Y8s02sNGJ5hbC0UQrghbe1ZbIw11N4OiFG4XIk
         DSEnUNdMduHOc8yIfqoxr4naPJQwa0TEqeY282EU8+00HUYdn5zFC3kmv3jy9lEK9LC7
         1bL28kSfhyeB+o20Nf6P/4Bcl56krHRfPoF79z6p9nOuBxAKHcaRgihNWMxAsLV2T0Pm
         YMD/c/UQlRx2bDDLQkuuUIWIyLbtglxrYJBYhZJAY3+RdQSAV+h6r6fEg0t1ZqS1OE3t
         6R0r4tAnJRJmz6Ivrb9DBE2OwH7oQU3+louYrADcBb3jm4srrSqBhsBochFGiQUAykDo
         QOgA==
In-Reply-To: <5431496.Ue9YL3Eeu2@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 08/20/2014 10:34 PM, Ivan Shapovalov wrote:
> On Wednesday 20 August 2014 at 01:39:42, Edward Shishkin wrote:	
>> On 08/20/2014 12:32 AM, Ivan Shapovalov wrote:
>>>   From `git log` I've seen that VFS people intend to replace ->aio_read() and
>>> ->aio_write() of struct file_operations with new methods ->read_iter() and
>>> ->write_iter().
>>>
>>> (Along with a couple of related new helpers, differing from previous just in
>>> calling _iter methods instead of aio_ ones.)
>>>
>>>   From other filesystems it seems that these are simple drop-in replacements
>>> (however, well, I have zero familiarity with VFS). So here is a question:
>>> is there any intentional reason that generic_file_aio_write() is not used
>>> in reiser4?
>>
>> Currently reiser4 is a set of two filesystems which differ in methods
>> of handling regular files. For VFS we provide "dispatchers", which pass
>> management to appropriate plugin (UNIX_FILE or CRYPTCOMPRESS).
>>
>> UNIX_FILE plugin doesn't use generic write for performance reasons
>> (I'll try to find the respective mailing thread). CRYPTCOMPRESS doesn't
>> use it for compatibility reasons: I don't know how how to rewrite it
>> gracefully using the generic write method.
>>
>> Edward.
>
> Thanks for explanation! So, does this patch make any sense?


I haven't looked at this carefully yet, but likely it is correct.

Thanks,
Edward.
