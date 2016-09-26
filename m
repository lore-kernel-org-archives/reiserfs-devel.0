From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 Upstream Git Repositories on GitHub
Date: Tue, 27 Sep 2016 00:37:33 +0200
Message-ID: <57E9A32D.3000108@gmail.com>
References: <57E6DF37.1050702@gmail.com> <1474927548.10826.6.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=2Qwq8R/1S/eIAQhHr0zfkq/ukIwzKeq2c6iWnvbtrqQ=;
        b=jp6BLnmcSDe+FQxUO56tJSxilEBYXz6aosv06MHXpEyv3J23C3gxB3B9hSnK2Pai29
         pYzuj29bOxe+aFjjIFJ0R6kAHOZofdGfMkHIsFynayC7FiRd3Q/9Xw4ZIsxZeHZHoLU0
         fBgmhsIGsVE6ovtu90uNwuswnhvPaeAgd93Ck9G6uv6GuqRcv+2zGOTkkDeIXesdN1YV
         PKfCK8Ik3KSjmwGg6GZ0M3V7oAWZ/fNGrKm4V1XstoxuvGZ7+uCGd/gaq0drLF0xavqN
         991coDmMdt1UIIah2zf33SwZR8CSOqtQP8wk99lFlgL6CHbhyvenMYH0FHt+B2+lnzPp
         X2WA==
In-Reply-To: <1474927548.10826.6.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

On 09/27/2016 12:05 AM, Ivan Shapovalov wrote:
> On 2016-09-24 at 22:16 +0200, Edward Shishkin wrote:
>> Hello everyone,
>>
>> I have set up the updated Namesys repositories at my Github page.
>> Those repositories are supposed to contain the latest updates in
>> the (stable) master branch and in other (experimental) branches that
>> I'll announce.
>>
>> 1) https://github.com/edward6/reiser4
>>
>> This is a "standalone" reiser4 tree, which doesn't include specific
>> changes of Linux kernel needed for reiser4 port. Such changes can be
>> found at the project's page on Sourceforge:
>> https://sourceforge.net/projects/reiser4/
>>
>> An example of work with the standalone reiser4 tree:
>>
>> . Patch the respective kernel with the latest available stuff from
>>     Sourceforge;
>> . cd to the "fs" directory;
>> . delete the directory reiser4;
>> . instead of the deleted stuff clone the standalone reiser4
>>     repository from Github;
>> . build and install as usual.
>>
>> 2) Libaal and Reiser4progs:
>>
>> https://github.com/edward6/libaal
>> https://github.com/edward6/reiser4progs
>>
>> Before building Libaal and Reiser4progs execute the ./prepare script,
>> which will create files needed for build process.
>>
>> Thanks,
>> Edward.
> Wow, finally.
>
> Maybe we could avoid that "all changes for 10 years" commit?

Hi Ivan,
Sorry, don't have a time to granulate it.

> I tried to keep track of all patches since 3.2...

There will be "all changes for 6 years" commit.
Is it much better?
