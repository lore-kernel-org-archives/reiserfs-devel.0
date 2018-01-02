From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [BUG]Reiser4-for-4.12 kernel: reiser4[rsync(9841)]:
 reiser4_write_dispatch (fs/reiser4/plugin/file/file_conversion.c:582)[edward-1544]:\x0aWARNING:
 Inode 98653: file plugin conversion failed (-2)
Date: Tue, 2 Jan 2018 18:21:32 +0100
Message-ID: <CADW=+3kj16Pfun5RZDFBgeT6PEKS3v_hHhabNvqjFjNEPGvzFw@mail.gmail.com>
References: <CADW=+3mv7Ly-Bd3ZTdGEGyZ0iAUmjmqxoe9C-DGNUmXtuA0hUw@mail.gmail.com>
 <762d9f56-1e76-d861-7e2f-2e042ded95ae@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4+XFrk6LP9VNvq4khjf0JH8yAEeIG4ImbEq/5ACFK5E=;
        b=NTyq+8b5T+oa4+sJ/YhGAoUDBRo08U8oiYERLB9glRrzADJs8uUDq9mFWRi3GQMoKP
         RLhv9CTgHSGhl9RCHhl9nlFx6ICCO/qzJLXqtcNXcyQ1+aXilEYDuR9SIr4V5md9ZqJh
         jysPdle7TLT/TkNpREt5UD0DzVqgTxVV1CtDEWgEJVQd/5Ll4gtVn1U+RA9rxkLtCphr
         BFwca9tNAcazb9ZLOFyl00BhEnyOK1iD9uQFjzr/u84bCoW5IHi301pv2jwL94jlaa02
         VQq0H0FyFDvHoZwyDgoyOqv+v2X1NCb7scU5GFjjuxRtunz1mtxG9ds7idK6TIDg2657
         dL2g==
In-Reply-To: <762d9f56-1e76-d861-7e2f-2e042ded95ae@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Tue, Jan 2, 2018 at 3:14 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Hi Dushan,
>
> Does this problem (failed plugin conversion) take place in 4.14?
>

No, 4.14 worked OK.

Was it the collision around 4.0.2 filesystem and 4.0.1 R4 kernel?

> Thanks,
> Edward.
>
>
> On 01/02/2018 08:52 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>
>> Hello
>>
>> On kernel 4.12 while rsync-ing /home to newly created reiser4
>> partition I get lots of messages in logs:
>>
>> kernel: reiser4[rsync(9841)]: reiser4_write_dispatch
>> (fs/reiser4/plugin/file/file_conversion.c:582)[edward-1544]:\x0aWARNING:
>> Inode 98653: file plugin conversion failed (-2)
>>
>> Partition was created with mkfs.reiser4 /dev/md125
>
>
