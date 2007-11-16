From: "Edward Shishkin" <edward.shishkin@gmail.com>
Subject: Re: Reiser4 and loop device problems
Date: Fri, 16 Nov 2007 14:03:07 +0300
Message-ID: <5c7c368b0711160303g773a4a5of35b36ededf9ec24@mail.gmail.com>
References: <5c7c368b0711151455l2cf7a080yff21884e5957d20b@mail.gmail.com>
	 <5c7c368b0711151503p6ae801fcsa3803fbd65443341@mail.gmail.com>
	 <473D41EA.4020107@inn.nl>
	 <5c7c368b0711160208i5af347fcgf3f029b17809ea0f@mail.gmail.com>
	 <473D6EB9.50005@inn.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=+0EJ4VAGrdF44No5k/H+8nGVww7zTkCMwWCyKuvSRu8=;
        b=DEB+f3c9vf718vV3dY+M6HqTb5dFp92YU8KwycBw2lr2YrxpJ6FHVZZgTARjOe4D32NeiAXkMXnYSXey7YTpwqnUdBEMIPdm33hN5RJiJstI0ew4eegDb2svBXQP4Sfpa7j16yG3bJfKoZWlB8irMkS2kBmkzkV3LrCt613Wm2Y=
In-Reply-To: <473D6EB9.50005@inn.nl>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>
Cc: Thomas Kuther <gimpel@sonnenkinder.org>

On 11/16/07, Arend Freije <afreije@inn.nl> wrote:
>
>  Edward Shishkin wrote:
>  On 11/16/07, Arend Freije <afreije@inn.nl> wrote:
>
>
>  Edward Shishkin wrote:
>
>
>
>  On Do, 15.11.07 22:49 "Dushan Tcholich" <dusanc@gmail.com> wrote:
>
>
>
>
>  Can you remember the last kernel that worked?
>
> Thanks
>
> Dushan
>
>
>  Unfortunately not for sure. I'm not even sure if it ever worked at all,
> to be honest. There were some old threads from 2003 saying that loop is
> not supported (yet). Did that ever change?
>
>
>  No, it didn't.
> Sorry..
>
>
>
>
>  On Nov 15, 2007 10:44 PM, Thomas Kuther <gimpel@sonnenkinder.org>
> wrote:
>
>
>
>  ...
> * filsystem created with
>  $ mkfs.reiser4
> * mounted with noatime
> * no cryptcompress or anything non-default
>
> $ mount -o loop -t
> iso9660 /tmp/systemrescuecd-x86-0.4.0.iso /mnt/cdrom ioctl:
> LOOP_SET_FD: Invalid argument
>
>
>
>  Hi,
>
>
>  Hello
>
>
>
>  Sorry for intruding, but I'm a bit surprised about the conformation on
> 'loop is not supported (yet)' question.
> The example of Thomas shows the mounting of an ISO-9960 file system via
> a loop device. All partions on my system are reiser4, and I can execute
> 'mount -t iso9960 -o loop' without any problem. Why do you confirm that
> loop is still not supported?
>
>
>  I tested it a long time ago and there were stall problems.
> Since nobody looked at this for a long time, I think, it would be better
> for this to be disabled..
>  Hi Edward,
>
>  Thanks for your reply. Just to be sure: do you want to disable mounting
> loop devices created with a file containing an image of a Reiser4 file
> system, or do you want to disable mounting loop devices (of any type) on top
> of a already mounted Reiser4 file system?
>

Loop devices created over reiser4 files don't work properly.
Do not try to use them for now.

Thanks,
Edward.
