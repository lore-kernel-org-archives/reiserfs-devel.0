From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 Upstream Git Repositories on GitHub
Date: Tue, 27 Sep 2016 16:04:03 +0200
Message-ID: <3ae966b7-00f3-47ca-8917-7f551b8fd04d@gmail.com>
References: <57E6DF37.1050702@gmail.com>
 <1474927548.10826.6.camel@intelfx.name> <57E9A32D.3000108@gmail.com>
 <1474940591.1773.4.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=9ph5AHsul0uVTF/NSWz+Sg+Re/Tj/1x2Br9BTOUzN4o=;
        b=cHkMQMM6J3KXLEJKC/g8pnayom7ELwsqH5bLKY0jfSlJLv38EMJ1H6odMbisas/evs
         SgSymMfkLuBSo4SpYPvsf8qXR/XCT4k9Uuxm+ncg5BVIlTw+IQs6FD60UwWGec5JqXqS
         Pb66NhII3LcSCSQdLc/F8S7+ucM9Elqdl4giEj3sin/fiEcA4Comx8IBpCwdrhkWD2X0
         fcXtdkM3N64KBMXxZ7HLgO4q7NVvU26lEDfmArss9/lHEL0yZPa7Xr1dczevOr+mH6IR
         BztdbL8JXnNbtVoahlyVFk86va9LWlMFds1Ow8eaRdfpTxSNXkeOtXqmOX6+OuHrC2xi
         kWeg==
In-Reply-To: <1474940591.1773.4.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

On 09/27/2016 03:43 AM, Ivan Shapovalov wrote:
> On 2016-09-27 at 00:37 +0200, Edward Shishkin wrote:
>> On 09/27/2016 12:05 AM, Ivan Shapovalov wrote:
>>> On 2016-09-24 at 22:16 +0200, Edward Shishkin wrote:
>>>> Hello everyone,
>>>>
>>>> I have set up the updated Namesys repositories at my Github page.
>>>> Those repositories are supposed to contain the latest updates in
>>>> the (stable) master branch and in other (experimental) branches
>>>> that
>>>> I'll announce.
>>>>
>>>> 1)https://github.com/edward6/reiser4
>>>>
>>>> This is a "standalone" reiser4 tree, which doesn't include
>>>> specific
>>>> changes of Linux kernel needed for reiser4 port. Such changes can
>>>> be
>>>> found at the project's page on Sourceforge:
>>>> https://sourceforge.net/projects/reiser4/
>>>>
>>>> An example of work with the standalone reiser4 tree:
>>>>
>>>> . Patch the respective kernel with the latest available stuff
>>>> from
>>>>      Sourceforge;
>>>> . cd to the "fs" directory;
>>>> . delete the directory reiser4;
>>>> . instead of the deleted stuff clone the standalone reiser4
>>>>      repository from Github;
>>>> . build and install as usual.
>>>>
>>>> 2) Libaal and Reiser4progs:
>>>>
>>>> https://github.com/edward6/libaal
>>>> https://github.com/edward6/reiser4progs
>>>>
>>>> Before building Libaal and Reiser4progs execute the ./prepare
>>>> script,
>>>> which will create files needed for build process.
>>>>
>>>> Thanks,
>>>> Edward.
>>> Wow, finally.
>>>
>>> Maybe we could avoid that "all changes for 10 years" commit?
>> Hi Ivan,
>> Sorry, don't have a time to granulate it.
>>
>>> I tried to keep track of all patches since 3.2...
>> There will be "all changes for 6 years" commit.
>> Is it much better?
> I've noticed that your tree has an if(0) in should_punch_hole(),
> while you've previously posted code for race detection in the hole
> punch mechanism, and this code is not in your tree... is this correct?

Yes, I disabled hole punching because of specific problems:
if the flush procedure can not find a parent of a dirty child
in the tree, then it jumps to error path and reports about
corruption.

If dirty page cluster contains only zeros, then hole punching
code kills its parent item (the idea of hole punching is that a
set of zeros is represented by nothing on disk). Thus, we need
to teach the flush code to handle that situation (absence of
parent) properly.

Unfortunately I exceeded time limits allocated for flush
modifications, so that task went to long-term TODO..

Edward.
