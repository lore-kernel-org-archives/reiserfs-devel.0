From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: porting to 3.16: any reason ->aio_read() of struct file_operations
 has been left out?
Date: Sat, 30 Aug 2014 18:22:51 +0200
Message-ID: <5401FA5B.4050905@gmail.com>
References: <10671542.MCAVDCHSND@intelfx-laptop> <5431496.Ue9YL3Eeu2@intelfx-laptop> <53F52195.1020900@gmail.com> <2194734.MaT6DR3706@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=Ta977qlbOOOpZdwAhGUXuq3ePakqK9rP/vhQBx1FvKE=;
        b=yHfNCXUhle7BagW42fZsgq5bhefDe5dN+08mC1bXdWK4rz5kRetIG2tnW4t3w7mK2s
         BbaCcF6XHsa/J82nlV8YvqdeEfrCIDQSNtxvue1b/zk6FfJYyM6MYiyhBLWMeJRVyfXf
         ++FHQZUc4zc5LGtoBBwERhJSvz3RmsYZ048VBEwdNBOefNbwnl8xtFXbrM1Z9lDQr2jz
         ddI8XOIsmWojg7X0zDVqHjCp3b/JuKs31Fn7CpAnEh0jDERdg19uwpcUqbPL+rOAbsz1
         la03xgwvhjv459Yk6stN8v7KHcEHZpxn8fkZXDzORXeWE+81kHH8HhsVjC2chYGlA04u
         K/nQ==
In-Reply-To: <2194734.MaT6DR3706@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 08/21/2014 05:05 PM, Ivan Shapovalov wrote:
> On Thursday 21 August 2014 at 00:30:45, Edward Shishkin wrote:	
>> On 08/20/2014 10:34 PM, Ivan Shapovalov wrote:
>>> On Wednesday 20 August 2014 at 01:39:42, Edward Shishkin wrote:	
>>>> On 08/20/2014 12:32 AM, Ivan Shapovalov wrote:
>>>>>    From `git log` I've seen that VFS people intend to replace ->aio_read() and
>>>>> ->aio_write() of struct file_operations with new methods ->read_iter() and
>>>>> ->write_iter().
>>>>>
>>>>> (Along with a couple of related new helpers, differing from previous just in
>>>>> calling _iter methods instead of aio_ ones.)
>>>>>
>>>>>    From other filesystems it seems that these are simple drop-in replacements
>>>>> (however, well, I have zero familiarity with VFS). So here is a question:
>>>>> is there any intentional reason that generic_file_aio_write() is not used
>>>>> in reiser4?
>>>> Currently reiser4 is a set of two filesystems which differ in methods
>>>> of handling regular files. For VFS we provide "dispatchers", which pass
>>>> management to appropriate plugin (UNIX_FILE or CRYPTCOMPRESS).
>>>>
>>>> UNIX_FILE plugin doesn't use generic write for performance reasons
>>>> (I'll try to find the respective mailing thread).


This mailing thread sheds the light on why we don't want to use generic 
write:
(this in only FYI, don't try to make friendship between reiser4 and VFS :))

http://markmail.org/message/ydzplf6bxokfgkch#query:+page:1+mid:appoj72tdeop3f7f+state:results


>>>>   CRYPTCOMPRESS doesn't
>>>> use it for compatibility reasons: I don't know how how to rewrite it
>>>> gracefully using the generic write method.
>>>>
>>>> Edward.
>>> Thanks for explanation! So, does this patch make any sense?
>>
>> I haven't looked at this carefully yet, but likely it is correct.
>>
>> Thanks,
>> Edward.
> Turned out it isn't.. The iter_file_splice_write() requires ->write_iter
> to be set, or a NULL dereference happens.
>
> At first I've thought that we're out of luck and will need to use the fallback
> splice implementation (default_file_splice_write), but just setting
> ->write_iter to generic_file_write_iter strangely worked.
>
> (By "it works" I mean "splice finishes successfully and does not cause data
> corruptions").
>
> Could you please comment on this? :)
>
> Thanks,

