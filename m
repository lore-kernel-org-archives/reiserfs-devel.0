From: Viji V Nair <viji@fedoraproject.org>
Subject: Re: reiser4 as a module
Date: Fri, 22 Oct 2010 21:16:48 +0530
Message-ID: <AANLkTin5Rq_Spo-+oJWKvN9tSOUo=iD9CicRWxmWB-R6@mail.gmail.com>
References: <AANLkTi=o5bXDxY4XKSYzcX9fX4yHZRC68=oMk0sikViS@mail.gmail.com> <4CC18948.5020500@ontolinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received
         :in-reply-to:references:from:date:x-google-sender-auth:message-id
         :subject:to:cc:content-type:content-transfer-encoding;
        bh=po1BE7uGuvpJItFc6C2P9MQ6ohUw7OVu+GfWor27KRg=;
        b=kvNE1/atoJQHxp/GskkAN1NozQJdU5KuxPBFTT7Bys7bmmrWUHfh+tiujkP8M3qTwk
         FALH8cws0eAfAMCxD9r1WKsRJd/zKLyU2XQpDsRAUduMp+dCi60nW5MhTVn9GORNTXeT
         WaFbKcOmWsFACQyKHrOX8y/wbCt8IoDF1IxVE=
In-Reply-To: <4CC18948.5020500@ontolinux.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christian Stroetmann <stroetmann@ontolinux.com>
Cc: linux reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hi

On Fri, Oct 22, 2010 at 6:23 PM, Christian Stroetmann
<stroetmann@ontolinux.com> wrote:
> =A0Hola;
>
> On the 22.10.2010 12:02, Viji V Nair wrote:
>>
>> Hi,
>>
>> I have been trying to build reiser4 as a module, but the module whic=
h
>> is getting compiled having the "symbol" issue.
>>
>> <snip>
>> reiser4: Unknown symbol lzo1x_1_compress
>> reiser4: Unknown symbol might_fault
>> reiser4: Unknown symbol mutex_lock_nested
>> reiser4: Unknown symbol zlib_deflate
>> reiser4: Unknown symbol writeback_inodes_wbc
>> </snip>
>
> You mentioned this problem in the thread [1] as well.
> Check your pathes.

Nobody replied to that thread :). I am planning to push reiser4 in the
fedora official repository.
I have checked the paths, looks fine. Even I tried with some other
modules (cifs) and those are getting compiled and loads with out any
issue.

>>
>> I could see from the reiser4 2.6.34 patch that it is adding
>> "EXPORT_SYMBOL" to few files in fs& =A0mm directories of the kernel
>> source tree. Can we have all these symbols defined in the core sourc=
e
>> tree of resier4 also? Do we have a patch for this already?
>
> For what? See above.
> Btw.: To be honest, I find it a little bit off-topic, because it's ab=
out
> compiling a kernel module and not a R4 issue.

This was working fine untill 2.6.10 patch. You can find the same issue
in Open Suse/Ubuntu/Mandriva mailing lists.
The missing symbols need to exported in the module level, I think. If
I compile the kernel completely everything works fine, but that is not
I want. I dont want to disturb the stock kernel.


>>
>> Thanks
>> Viji
>
> [1] Compilation Issue - Reiser4
> http://www.spinics.net/lists/reiserfs-devel/msg02508.html
>
> Have fun
> Christian O>-< =A0 *<:o) =A0 _(D)>-<
>

Thank you so much for your support

Viji
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
