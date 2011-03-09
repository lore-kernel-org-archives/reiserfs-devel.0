From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: File copy problems kde 4.5 to 4.6.1 with reiser4
Date: Wed, 09 Mar 2011 12:46:47 +0100
Message-ID: <4D7768A7.10107@gmail.com>
References: <201103090918.47762.berny@dwami.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=Hy2xXfaXN9r/10mx/uH4r3jq/H6FXYtpwQBMAeJZX1s=;
        b=YpHdmpblnTJPOPdEON56+ypH0lqUsd4a6PaQAXZifN84Sffo5XzjASLNr+p2KwpvHu
         kbA/UOZ+sumPQauVYjjD/ShBGfpUF6aAbdr1WeKpnK1ySQoFLkovnLRdozxYIHjvKP56
         LJ5mmErSMHtHm9hbTrFzTo2elUe596/buODtQ=
In-Reply-To: <201103090918.47762.berny@dwami.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?berny=AE?= <berny@dwami.com>
Cc: reiserfs-devel@vger.kernel.org

On 03/09/2011 10:18 AM, berny=AE wrote:
> Hi Edward,

Hello.

> first thank you for your work.
>
> I'm using reiser4 for all my partitions on my working machine with ke=
rnel 2.6.37 with no problems
> except one annoying one that is going on from months.
> When I copy a file (whatever) from one directory to another with konq=
ueror, dolphin or krusader with
> kde 4.6.1 the file get copied, it's size is correct but it is empty.
>
> This happen only in the partitions formatted with reiser4 and not on =
the xfs, reiser3 ones.
>
> If I restart the pc, when I'm back all the files that were empty are =
now ok, it is like on un
> mounting the files get finalized and then on the next boot they are n=
ormally accessible.


Does sync(1) without umount make them accessible?


> No errors are shown during copy and file system is clean.

Are there any suspicious kernel messages when trying
to access the "empty" files?

Thanks,
Edward.


> I discovered that this is also signaled like a kde bug 251392 with st=
atus unconfirmed.
>
> If I copy from a terminal with cp, rsync, mc the file get copied corr=
ectly so it is only in the
> combination kde + reiser4 that I get problems.
> Don't know if it is a bug of reiser4 or of kde.
>
> My mount options are no_write_barrier,dont_load_bitmap, the rest is d=
efault, the volumes are normal,
> I mean not cryptocompress.
> An interesting thing, if I format the reiser4 with cryptocompress sup=
port (-o create=3Dccreg40,
> compress=3Dlzo1) this behavior don't happen, I mean the files are cop=
ied correctly so it seems only to
> affect normal uncompressed reiser4 volumes.
> Hope this can be of help to you.
>
> Thank you,
> warm regards,
> Paolo
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
