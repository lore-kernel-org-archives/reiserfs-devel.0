From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 patch and formatting partitions
Date: Fri, 31 Aug 2012 08:24:13 +0200
Message-ID: <5040588D.10501@gmail.com>
References: <ffc5fb825e3c08c0f37e9696d3025d65@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=oPpTFFxpSbbpePOa3ZteldnP/TDnUvUlRbAfrzalots=;
        b=z8711nQDxZygde4dtqbPb84DvBIuwLqh3bFAIDda7j1lM+wGxU+d8riQkIJn5IoPiS
         vfNuGUWxGSIZVvW+CZ745M4b54rYdPsHRHJ+ooCL2yDyHaI5MaABJ88WLUZ11StRCxyL
         Lx4i0pQPsIeZQByeE90Nho4C7Hnq4NQh5W/1vuyczIITZv8odk/loCJpyAGiqU0J5lmy
         lGLnXHayutLFAK3nsgpFWLK6m6YgwVdD4JyB01dbplQCFTkcw0moj68rD01/9jqmfwyh
         UOISzjzDh2yWcN611IrzIhiwGOXFhYBaouEztnB5sMvckaAtVHvEKWB7m143OaXvonNn
         ixig==
In-Reply-To: <ffc5fb825e3c08c0f37e9696d3025d65@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 08/31/2012 05:19 AM, doiggl@velocitynet.com.au wrote:
> Hello,
> Is the reiser4 patch with the [kernel 3.1 stuff by Marcin Baczy=C5=84=
ski]
> available somewhere to try out.
> - Can the patch be accessed from [1] when it is released.


This is not yet reviewed/tested.


> - Should I use the format option -o "formatting=3Dextents" when creat=
ing a
> partition e.g
> mkfs.reiser4 -o create=3Dccreg40,formatting=3Dextents /dev/sdaX


No.
Cryptcompress file plugin doesn't use extents. It uses
tail packing technique, which uses the buggy balance primitive.


>
> Information from this thread [2]
>
> Thanks
> Glenn
>
> [1] http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-2=
=2E6/
> [2] http://www.spinics.net/lists/reiserfs-devel/msg03216.html
>
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
