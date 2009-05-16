From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: oops with 2.6.30-rc6 and reiserfs
Date: Sat, 16 May 2009 23:12:52 +0400
Message-ID: <a4423d670905161212u53869568ha9b6fa6a2b1c97e4@mail.gmail.com>
References: <87zldc9987.fsf@sycorax.lbl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=pgZnC7kudY79d7zGX892O76atO78YkgXsvC+3kslAO8=;
        b=Xkd76YbLrgYH+o6vzqwgut6J832WVLEeZgOZaQxDmqCIoXRqOyPhRZnAIxt9NihUhr
         +AwKR+Q3HAb7yEh1XeMsHJIfOEDFm7i5FlMxfPJjH4RszWAPmwZ0wn7uySi6N0Uug1ks
         1aGN6iejIawah9YmeT+jhLVEoycvF+m4XkpLI=
In-Reply-To: <87zldc9987.fsf@sycorax.lbl.gov>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alex Romosan <romosan@sycorax.lbl.gov>
Cc: linux-kernel@vger.kernel.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>

2009/5/16 Alex Romosan <romosan@sycorax.lbl.gov>:
> i get an oops trying to boot into 2.6.30-rc6 with reiserfs as the roo=
t
> partition. the root partition never gets mounted rw so there is
> nothing in the logs but i took a picture of the screen on the laptop:
>
> =C2=A0http://costard.lbl.gov/~romosan/dsc05513.jpg
>
> these are the config options i use relevant to reiserfs:
>
> CONFIG_REISERFS_FS=3Dy
> # CONFIG_REISERFS_CHECK is not set
> # CONFIG_REISERFS_PROC_INFO is not set
> # CONFIG_REISERFS_FS_XATTR is not set
>
> hope this helps.
>

Add CC.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
