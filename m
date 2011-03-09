From: Berny <berny@dwami.com>
Subject: Re: File copy problems kde 4.5 to 4.6.1 with reiser4
Date: Wed, 09 Mar 2011 12:46:36 +0000
Message-ID: <4D7776AC.2050906@dwami.com>
References: <201103090918.47762.berny@dwami.com> <4D7768A7.10107@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D7768A7.10107@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hi Edward, thanks for answering.

No sync doesn't make any difference, I need to unmount.
I don't get any errors, for example if I copy a txt file and I open it=20
with kwrite, it is simply empty but I get no error from application or=20
os (like dmesg and alike) and ls or konqueror show me the correct size=20
of the file, it is simply apparently empty.
If I do file <name> I got empty file.

Thanks,
Paolo




On 03/09/2011 11:46 AM, Edward Shishkin wrote:
> On 03/09/2011 10:18 AM, berny=AE wrote:
>> Hi Edward,
>
> Hello.
>
>> first thank you for your work.
>>
>> I'm using reiser4 for all my partitions on my working machine with
>> kernel 2.6.37 with no problems
>> except one annoying one that is going on from months.
>> When I copy a file (whatever) from one directory to another with
>> konqueror, dolphin or krusader with
>> kde 4.6.1 the file get copied, it's size is correct but it is empty.
>>
>> This happen only in the partitions formatted with reiser4 and not on
>> the xfs, reiser3 ones.
>>
>> If I restart the pc, when I'm back all the files that were empty are
>> now ok, it is like on un
>> mounting the files get finalized and then on the next boot they are
>> normally accessible.
>
>
> Does sync(1) without umount make them accessible?
>
>
>> No errors are shown during copy and file system is clean.
>
> Are there any suspicious kernel messages when trying
> to access the "empty" files?
>
> Thanks,
> Edward.
>
>
>> I discovered that this is also signaled like a kde bug 251392 with
>> status unconfirmed.
>>
>> If I copy from a terminal with cp, rsync, mc the file get copied
>> correctly so it is only in the
>> combination kde + reiser4 that I get problems.
>> Don't know if it is a bug of reiser4 or of kde.
>>
>> My mount options are no_write_barrier,dont_load_bitmap, the rest is
>> default, the volumes are normal,
>> I mean not cryptocompress.
>> An interesting thing, if I format the reiser4 with cryptocompress
>> support (-o create=3Dccreg40,
>> compress=3Dlzo1) this behavior don't happen, I mean the files are co=
pied
>> correctly so it seems only to
>> affect normal uncompressed reiser4 volumes.
>> Hope this can be of help to you.
>>
>> Thank you,
>> warm regards,
>> Paolo
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
