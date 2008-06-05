From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: zen-sources (reiser4 for 2.6.25) reiser4 cryptocompress oops
 on loop
Date: Thu, 05 Jun 2008 04:36:03 +0400
Message-ID: <484734F3.8070302@gmail.com>
References: <a08621850806040608u3a15125aic2ebbde5da12eb81@mail.gmail.com> <48472EC9.4000705@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <48472EC9.4000705@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dushan Tcholich <dusanc@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Edward Shishkin wrote:
> Dushan Tcholich wrote:
>   
>> I'm transfering a gentoo user report of reiser4 problems:
>>
>> Quote:
>> For me it only panicks when intensive operations are performed on loop
>> file (portage sync, unmount). Main partition is R4CC with default
>> settings with two loop files (portage and ccache) on it. Both are R4CC
>> formatted as well. The first one (portage) is created as sparse file,
>> second one (ccache) is ordinary prealocated loop file. Kernel panic
>> occurs when I sync/unmount portage loop file.
>>     
>
> Loop devices over cryptocompress files don't work.
> I disabled this functionality, but it seems the stub has
> been broken at some point.
>
> I'll try to fix the loop functionality for cryptcompress files.
> For now in order to create loop devices use files managed
> by (classic) unix-file plugin, Ok?
>
> On a ccreg40 partition a file powered  by unix-file plugin
> can be prepared, for instance, by  the following way:
>
> dd if=incompressible_file of=loopfile bs=65537 count=1

I assume that a file with the name "loopfile" didn't exist before
(to ensure a conversion cryptcompress->unix-file)

> then rewrite the loopfile with any data you want: it won't
> be converted back to cryptcompress format anymore.
> As "incompressible_file" have any .gz or .bz2 file of size > 64K
>
> I know, it looks like ugly workaround, but I believe we'll invent
> more user-friendly interface to assign desired plugins in future..
>
> Edward.
>
>   
>>  Only messages I got are:
>> reiser4 panicked cowardly: reiser4[pdflush(212)]: reiser4_handle_error
>> (fs/reiser4/vfs_ops.c:232)[foobar-42]:
>> Kernel panic - not syncing: reiser4_handle_error
>> (fs/reiser4/vfs_ops.c:232)[foobar-42]:
>>  I'd like to point out that this setup worked for few days without
>> problems, but later, probably when sparse file started to grow, it
>> started panicking.
>> /Quote
>> More pointers: http://forums.gentoo.org/viewtopic-p-5112215.html#5112215
>>
>> I hope this is useful to you
>>
>> Dushan
>>
>>   
>>     
>
>
>   

