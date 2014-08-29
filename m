From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4progs revision.
Date: Fri, 29 Aug 2014 15:27:43 +0200
Message-ID: <54007FCF.6050500@gmail.com>
References: <114fff4391af47417e806586fb761345@mail.velocitynet.com.au> <24322648.R9GnluWRk3@intelfx-laptop> <458361e3164a300c930420b3dd9e5b43@mail.velocitynet.com.au> <53FDD565.6030500@gmail.com> <4a7ae00218566234cc327500710d1a61@mail.velocitynet.com.au> <53FF26A2.2060300@gmail.com> <30cfa4f297251197e8b5fa1c669d13c9@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=7QHtWXVs+GS1uz+M85ooMSjYVEzw7BScTEPn9eU0Txs=;
        b=Gmau0xNrObl4fv0lE/TuxlEs+Rt0II5RmTfn4q/Ha3XysloX75/B5Toj6qURn611OD
         bnqnJVvxtUhNLJmORVrEeTvWJCdX+DEWcXoLmxC3KW0WV3q1X+hFuZ3VaBvkF+VBx+aX
         ++IVVu+ztXVFLYCW1o6g7uEzPOHFCWI9S9EoMIK6wXmH8ovuPCdxds2BrLBT0bWic4Nx
         TGgFmHQ1p/OTYPmbT42MVUQljpCs6V84Z17wF+WPNl8OZ/1S7udXku4FSRHhVv+lI7Sg
         biUgblsylNYAb+YSmdXb2WKW7Yu9n+smv/AKMhwRRk0ur7GDQ3sBA011TACfVLgbONAb
         zgyQ==
In-Reply-To: <30cfa4f297251197e8b5fa1c669d13c9@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

On 08/29/2014 04:16 AM, doiggl@velocitynet.com.au wrote:
>>>> This is a bug in fsck: it jumps to wrong branch for some reasons.
>>>> Not yet fixed.
>>>>
>>>> Edward.
>>> Hello,
>> Hello.
>>
>>> Some questions:
>>>
>>>    - Can fsck be fixed so it jumps to "correct" branch branch. ?
>> Yes, it can.
>>
>>>    - It would be useful to display a message when a Node or key is
> fixed.
>> Why?
>>
>>
>> Thanks,
> Hello,
>
> Can you send me the .patch file so it jumps to "correct" branch branch. ?


Wait for the reiser4progs release with the announce of fixed diagnostics 
in fsck.


>
> I can apply patch to the spec file and retest using # fsck.reiser4
> --build-fs /dev/sdb
>
> [1] spec file locations
> I can do a test with:
> https://build.opensuse.org/package/view_file/home:doiggl:branches:filesystems/reiser4progs/reiser4progs.spec?expand=1
> https://build.opensuse.org/package/show/home:doiggl:branches:filesystems/reiser4progs
>
> ##
>
> RE:
> - It would be useful to display a message when a Node or key is fixed.
> Why?
>
> Thanks,
> Edward.
>
> Reason for asking:
> Would be nice to know if a Node or key is fixed.


fsck perfectly reports about performed fixups.

Edward.
