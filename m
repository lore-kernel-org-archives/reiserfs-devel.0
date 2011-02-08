From: Dushan Tcholich <dusanc@gmail.com>
Subject: Re: Reiser4: errors AFTER fsck
Date: Tue, 8 Feb 2011 20:02:45 +0100
Message-ID: <AANLkTikc_fDjU60AHK8m1ihH7Br7Q1z+xJi8qXhYCAQm@mail.gmail.com>
References: <loom.20080405T115310-647@post.gmane.org>
	<1207585006.31700.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=BwPF9cNwdQEuulkuy0fZi4VetlYeK11JOrUi8a797qM=;
        b=TcIfYOGULV3DZqHIreCw5RnjsbVTkuiMrmSgfJnvYY7ulNl1tptGyqPdRdtblXjgEc
         3DT4aaF38B3zxUEw7AiHLKqJEKtOggxmiLhgydFpRIo/TXaGYIa3mn9Q1clCbAkaV7Kd
         ZdcRhMcLBw8yBQ+f9fKTLcBntZ4R4PYXEXsCE=
In-Reply-To: <1207585006.31700.2.camel@localhost>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Zan Lynx <zlynx@acm.org>
Cc: Mat <jackdachef@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>

I just had same trouble with 2.6.35

=46eb  8 15:13:38 krshina3 kernel: [1350289.587822]
reiser4[find(14082)]: key_warning
(fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
=46eb  8 15:13:38 krshina3 kernel: [1350289.587824] WARNING: Error for
inode 3293039 (-2)
=46eb  8 15:13:38 krshina3 kernel: [1350289.587840]
reiser4[find(14082)]: key_warning
(fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
=46eb  8 15:13:38 krshina3 kernel: [1350289.587841] WARNING: Error for
inode 3293039 (-2)
=46eb  8 15:13:38 krshina3 kernel: [1350289.587854]
reiser4[find(14082)]: key_warning
(fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
=46eb  8 15:13:38 krshina3 kernel: [1350289.587856] WARNING: Error for
inode 3293039 (-2)

On fsck.reiser4 --build-fs I got like ~700 files in lost+found with los=
t names.
=46S seems consistent now.
I moved to 2.6.36

Have a nice day

Dushan

On Mon, Apr 7, 2008 at 6:16 PM, Zan Lynx <zlynx@acm.org> wrote:
> On Sat, 2008-04-05 at 12:06 +0000, Mat wrote:
>> Volker,
>>
>> storing the portage-tree on a "critical" partition such as /var isn'=
t probably a
>> good idea (yet),
>> reiser4 gets more stable on an almost daily / weekly basis now but I=
 still have
>> the feeling that it's somewhat fragile in terms of use as a / (root =
/ system)
>> partition; data-partitions seem to be completely rock-solid & safe, =
though :)
>
> I have been using Reiser4 as / on my laptop for a couple of years now
> and have not had any serious problems that caused data loss. =C2=A0I'=
ve had a
> few problems here and there but they have been solved fairly quickly.
> I've had to run full tree rebuilds overnight several times but never
> lost anything I've missed. :)
>
> I do run nightly backups to an external disk, that's probably why I
> never lost anything. =C2=A0Murphy is waiting for the external disk to=
 fail
> before he screws me. :)
> --
> Zan Lynx <zlynx@acm.org>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
