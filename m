From: Matthew <jackdachef@gmail.com>
Subject: Re: reiser4-for-2.6.22-2.patch
Date: Fri, 17 Aug 2007 16:50:49 +0200
Message-ID: <e85b9d30708170750sb68c969s1980a35d9a63667d@mail.gmail.com>
References: <loom.20070728T013136-358@post.gmane.org>
	 <46ABACE8.4050306@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=ElId6PUc+Fq4GjbmlJSFjfwSNM4aSKobpGU0IJoXQV3qVYGVRjpN7ON2+i51xrsO7GEL7+7blsE2N+pQXwfE8bDO09grrMQW0hrA5A2S18hCKW0i4/aotiWegJi/T9mfa3MmIVI3quDEQq2JyeOQJEnPW3jTC3DGLxYL5EG+1jw=
In-Reply-To: <46ABACE8.4050306@namesys.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-devel@vger.kernel.org

On 7/28/07, Edward Shishkin <edward@namesys.com> wrote:

    Mat wrote:

    >I compiled a 2.6.22-based kernel with this patch & ran some tests
with default
    >reiser4 today - all I can say:
    >
    >you guys did an excellent job!
    >there's no corruption anymore, reiser4 feels rockstable & fast as always
    >
    >thanks a lot :)
    >
    >(I will test cryptcompress later, probably during the weekend & post if I
    >encounter any significant problems which I don't expect to happen :) )
    >
    >

    Yes, please.. Have the latest patch:
    ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.22/reiser4-for-2.6.22-2.patch.gz
    (it fixes some problems in the case when compression is enabled _and_ debug
    option is on).

    Thanks,
    Edward.


First of all sorry for the long delay and thanks for that patch :) ,

I'm rebuilding 2 systems right now and haven't noticed any severe hang
ups or data losses - great !
as memory is limited on these machines (1 GB) and heavy compiling is
happening I had expected OOM error or similar problems like in earlier
kernel versions but none happened!
a clear sign, that reiser4 is getting pretty mature

access time from time to time is a little high (e.g. launching of
firefox, openoffice and the kind) but ok, probably due to debug being
enabled

the only real "issue" is its still bad fsync / sync behavior:

in several cases if I call: "sync" it just sits there and syncs for up
to 15-30 minutes ! (called during idle),
I'm still able to launch apps but that state's not really acceptable
during everyday work or in heavy loads ( e.g. wanting to sync & then
shutdown the computer / laptop)
I suspect that it has to do something with preemptible setting in the
kernel but not sure, on the other computer with voluntary preemption
it seems to do better

I unfortunately can't investigate any further but only use it
regularly and see if I encounter any other problems (much work to do)

that's all so far

as already written:
keep up the good work & thanks a lot


Mat
