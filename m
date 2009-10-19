From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 on 2.6.31.4 freezes process accessing file, fsck 1.0.7
 finds no inconsistency
Date: Tue, 20 Oct 2009 01:07:10 +0200
Message-ID: <4ADCF11E.9040002@gmail.com>
References: <4ADB9242.30808@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4ADB9242.30808@web.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Konstantin <newsbox1026@web.de>
Cc: reiserfs-devel@vger.kernel.org

Konstantin wrote:
> Hi!
>
> I am running reiser4 for a few years now without problems. Yesterday I
> had an undeletable directory which ls -a reported empty but rmdir
> claimed not to be empty. There were no kernel messages about it. After
> fsck-ing I had to run fsck.reiser4 --build-fs (reiser4progs 1.0.7) which
> finished but printed an error at the very end like "application error"
>   

Maybe "Operational error occurred while fscking"?
If so, then you have encountered a bug in fsck.

> (sorry, I didn't wrote it down). A second run of fsck.reiser4 told me to
> fix some remaining corruptions using --fix. This worked without error
> messages and a following fsck told me everything is OK.
>
> But then accessing a file froze the process, consuming 100% CPU. I tried
> cat and cp with same result. The processes could not be terminated nor
> killed. Still no kernel messages. Only rebooting helped here and a
> following fsck showed no corruptions. The file could be renamed and
> deleted which kind of solved the problem. I haven't found (yet) another
> file like this.
>
> Before deleting the bad file I did a debugfs.reiser4 -P to store the
> metadata so if anyone is interested in debugging this bug contact me to
> give you the file (34MB bz2).
>   

Yes, please,
could you provide the metadata for download and the name
of problem file?
Actually, it would be better to have metadata right after the
first fsck complaint about operational error, but anyway,
this is better then nothing..

Thanks,
Edward.

> Konstantin
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

