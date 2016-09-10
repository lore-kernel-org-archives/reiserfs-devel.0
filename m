From: Mettavihari D <tv.lists@gmail.com>
Subject: Re: Fwd: options in reiser4
Date: Sat, 10 Sep 2016 21:44:06 +0530
Message-ID: <CAMRsyOdzjkjhthdaGtfOTcmUOrdvX78L+fH0KaHCaPwEpgw_+w@mail.gmail.com>
References: <CAMRsyOdqkwPq_UGRVR0DyNrptrHtJmR2R-1ifGS-p+V+=GoOFQ@mail.gmail.com>
 <CAMRsyOdr43GheHUEUzhqHfEO_iie=ZD1i+BzRTfUwQUxVzLvaQ@mail.gmail.com> <57D4199C.5010307@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=NyV10voIf8Hlgngzy7cxme34i2ZRlGZoH0QxSOT49h0=;
        b=Oj1BzJm43Ug3c+eD03RN6JLwbta/IGYk0G+KhqQpMh75lSjwfkjJSovkRs57ZPb3Re
         wfwZnoJxWQt9C0XGvJk/Tg989lTJOOLlSOQ/nI33Z7Rw5Vst7U4oN78juVfugNfTLuhP
         jCDgvS9S8BwPp9LTCTiiNXzkseh3K8OBtFbpXvN6517CrwryAo1odJ+oSWOYZtkZrgQN
         vJFRqsDgWiGWxqFdKaGbR71bx8EiZztAMDXZuWnIdf9YeO/Eu/mOld9zIVvEpZggvKGI
         c+w8kFTeQboSJuo48GJ3Ua+7YheKe6umeHcINyMwry/AjZ4WLbVNbq9Qi+73sRFviff/
         SRzQ==
In-Reply-To: <57D4199C.5010307@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Linux Reiserfs Devel <reiserfs-devel@vger.kernel.org>

Greetings


Thank you for the information

> Badblocks are unsupported in Reiser4 (as well as resizing the volume).

Any reason that Badblocks in not supported ?

with metta
Mettavihari

> Thanks,
> Edward.
>
>
> On 09/10/2016 03:38 PM, Mettavihari D wrote:
>>
>> Greetings,
>>
>> I have been using reiserfs for several years and I have been happy
>> with the Filesystem
>>
>> One thing that has been very useful in the fs is
>> Options:
>>    -B | --badblocks file            store all bad blocks given in file on
>> the fs
>>
>> I today installed reiser4 to see how the new reiser4 was, however I did
>> not find
>> Options:
>>    -B | --badblocks file            store all bad blocks given in file on
>> the fs
>>
>> This is what -h give me
>> Usage: mkfs.reiser4 [ options ] FILE1 FILE2 ... [ size[K|M|G] ]
>> Mkfs options:
>>    -s, --lost-found              forces mkfs to create lost+found
>>                                  directory.
>>    -b, --block-size N            block size, 4096 by default, other
>>                                  are not supported at the moment.
>>    -U, --uuid UUID               universally unique identifier.
>>    -L, --label LABEL             volume label lets to mount
>>                                  filesystem by its label.
>> Plugins options:
>>    -p, --print-profile           prints the plugin profile.
>>    -l, --print-plugins           prints all known plugins.
>>    -o, --override TYPE=PLUGIN    overrides the default plugin of the type
>>                                  "TYPE" by the plugin "PLUGIN" in the
>>                                  profile.
>> Common options:
>>    -?, -h, --help                prints program usage.
>>    -V, --version                 prints current version.
>>    -y, --yes                     assumes an answer 'yes' to all questions.
>>    -f, --force                   makes mkfs to use whole disk, not
>>                                  block device or mounted partition.
>> root@edu-SVE1713C5E:/root#
>>
>> Please let me know if this option is available or not in the new version.
>>
>> with metta
>> Mettavihari
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>



-- 
Streaming video from http://learntv.lk
