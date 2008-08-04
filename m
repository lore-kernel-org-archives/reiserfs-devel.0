From: "Dushan Tcholich" <dusanc@gmail.com>
Subject: Re: kernel BUG at fs/reiser4/plugin/item/ctail.c
Date: Mon, 4 Aug 2008 23:57:53 +0200
Message-ID: <a08621850808041457y2f30559ve104c2a86a5f9970@mail.gmail.com>
References: <558.1643-13003-1386678025-1217242012@post.cz>
	 <488DD846.70002@gmail.com>
	 <a08621850808040328o36ab4901m63a0d978a221e833@mail.gmail.com>
	 <48971680.2010906@gmail.com>
	 <a08621850808040757h2f421e38lc295fb54fc719687@mail.gmail.com>
	 <4897333E.3030600@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=lJ69viw4OcHp6xOMJHXYHDhiXzTOi1tMsjt14k7XYCs=;
        b=MG7mK9X4mCksZlzZwb+WrSwUzOtH/1zPN2BJBYRslemuCBs3URjd0+GItX10eXXOYb
         h9dXrRy3C/FXl7br1TM1uQ/zUE+O27Ujx13E72xgVk21JgoH+2NmHwYHItoOVqDrOqgD
         VizzTcpctQpDDENTAhoWlx4rM5w+7k9keXWnk=
In-Reply-To: <4897333E.3030600@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: "Mr. Tao" <tao@post.cz>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

On Mon, Aug 4, 2008 at 6:50 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Dushan Tcholich wrote:
>> On Mon, Aug 4, 2008 at 4:47 PM, Edward Shishkin
>> <edward.shishkin@gmail.com> wrote:
>>
>>> Dushan Tcholich wrote:
>>>
>>>> Would it be possible if there would be a new version of fsck.reiser4
>>>> to fix those false positives about wrong size when checking
>>>> cryptocompress partitions?
>>>>
>>>>
>>> Yes,  per-file warnings about wrong i_bytes should be suppressed.
>>> Fsck just should report at the end of work in default mode, that N wrong
>>> i_bytes were detected and suggest to fix it with --fix option.
>>> Anyone care to try to make a patch?
>>>
>>>
>> But what happens with systems with ccreg and fsck on boot? They would
>> stop and wait for user interaction.
>>
>
> Why?
> Do you have any problems with boot?

I don't have problems.
I just thought that checking for these false positives lasted 10
minutes on my 6GB / so wouldn't this be a little too long if we don't
put some status of some sorts?

>> Or you meant just to print a message about it with recomended solution
>> and continue.
>>
>
> Everything should be the same except per-file warnings.
>
Maybe a better explanation would be better instead just: "600000 small
errors found" :)

>> I'd like to make a patch but dunno how :)
>>
>>
>>>> There are some users that reported those and it's not comforting when
>>>> your fs spews thousands of errors, even when someone tells you they're
>>>> false.
>>>>
>>>> Oh and what about making cryptocompress default format on mkfs.reiser4 ?
>>>>
>>>>
>>> mm.. not sure. First, fsck should be fixed to remove unprepped items.
>>>
>> Ofcourse.
>>
>>
>>> Mr. Tao, do you still have partitions that make fsck segfault?
>>>
>>> Thanks,
>>> Edward.
>>>
>>>
>> Dushan
>>
>>
>
>
